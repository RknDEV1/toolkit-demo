import SwiftUI
import SwiftToolkit
import SwiftUIKit

struct FaceIDLoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isLoading = false
    @State private var status = ""
    @State private var isLoggedIn = false
    @State private var showToast = false
    @State private var appear = false

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Spacer(minLength: 20)

                Image(systemName: "faceid")
                    .font(.system(size: 64))
                    .foregroundStyle(.tint)
                    .scaleEffect(appear ? 1 : 0.6)
                    .opacity(appear ? 1 : 0)
                    .animation(.spring(response: 0.5, dampingFraction: 0.7).delay(0.1), value: appear)

                Text("Entrar")
                    .font(.largeTitle.weight(.bold))
                    .opacity(appear ? 1 : 0)
                    .offset(y: appear ? 0 : 10)
                    .animation(.easeOut(duration: 0.4).delay(0.15), value: appear)

                Text("Use e-mail e senha ou Face ID")
                    .foregroundStyle(.secondary)
                    .opacity(appear ? 1 : 0)
                    .animation(.easeOut(duration: 0.4).delay(0.2), value: appear)

                VStack(spacing: 16) {
                    ValidatedTextField("E-mail", text: $email)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)

                    ValidatedTextField("Senha", text: $password)
                        .textContentType(.password)

                    PrimaryButton("Entrar", isLoading: isLoading) {
                        Task { await loginWithPassword() }
                    }
                    .disabled(email.isEmpty || password.isEmpty)

                    Button {
                        Task { await loginWithFaceID() }
                    } label: {
                        Label("Entrar com Face ID", systemImage: "faceid")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.accentColor.opacity(0.12))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    .disabled(!BiometricAuth.isAvailable || isLoading)
                }
                .opacity(appear ? 1 : 0)
                .offset(y: appear ? 0 : 20)
                .animation(.easeOut(duration: 0.45).delay(0.25), value: appear)

                if !status.isEmpty {
                    Text(status)
                        .font(.subheadline)
                        .foregroundStyle(status.contains("sucesso") ? .green : .secondary)
                        .multilineTextAlignment(.center)
                        .transition(.opacity.combined(with: .move(edge: .top)))
                }

                if isLoggedIn {
                    CardView {
                        VStack(spacing: 8) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.title)
                                .foregroundStyle(.green)
                            Text("Bem-vindo!")
                                .font(.headline)
                            Text("Autenticado com sucesso")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .transition(.asymmetric(
                        insertion: .scale(scale: 0.9).combined(with: .opacity),
                        removal: .opacity
                    ))
                }

                Spacer()
            }
            .padding()
            .animation(.spring(response: 0.45, dampingFraction: 0.8), value: isLoggedIn)
            .animation(.easeInOut(duration: 0.25), value: status)
        }
        .navigationTitle("Login")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear { appear = true }
        .overlay(alignment: .top) {
            if showToast {
                ToastView(message: status, isPresented: $showToast)
                    .padding(.top, 8)
                    .transition(.move(edge: .top).combined(with: .opacity))
            }
        }
    }

    private func loginWithPassword() async {
        isLoading = true
        status = ""
        defer { isLoading = false }

        guard Validator.isValidEmail(email) else {
            status = "E-mail inválido"
            Haptic.error()
            showToast = true
            return
        }

        try? await Task.sleep(nanoseconds: 600_000_000)

        isLoggedIn = true
        status = "Login com sucesso"
        Haptic.success()
        showToast = true
    }

    private func loginWithFaceID() async {
        isLoading = true
        status = "Autenticando…"
        defer { isLoading = false }

        do {
            let success = try await BiometricAuth.authenticate(
                reason: "Confirme sua identidade para entrar"
            )

            if success {
                isLoggedIn = true
                status = "Login com Face ID"
                Haptic.success()
                showToast = true
            }
        } catch {
            status = error.localizedDescription
            Haptic.error()
            showToast = true
        }
    }
}
