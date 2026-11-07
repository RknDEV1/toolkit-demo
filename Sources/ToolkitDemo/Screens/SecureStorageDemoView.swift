import SwiftUI
import SwiftToolkit
import SwiftUIKit

struct SecureStorageDemoView: View {
    @State private var status = "Pronto"
    @State private var savedValue = ""
    @State private var loadedValue = ""
    @State private var isLoading = false
    @State private var appear = false

    private let demoKey = "demo-secret"

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                SectionHeader("Armazenamento seguro + Biometria")
                    .opacity(appear ? 1 : 0)
                    .offset(y: appear ? 0 : 8)

                CardView {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: biometricIcon)
                                .font(.title2)
                                .foregroundStyle(BiometricAuth.isAvailable ? .green : .secondary)
                                .symbolEffect(.pulse, isActive: isLoading)

                            VStack(alignment: .leading) {
                                Text(BiometricAuth.typeName)
                                    .font(.headline)
                                Text(BiometricAuth.isAvailable ? "Disponível" : "Não disponível")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }

                        Text("Status: \(status)")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
                .opacity(appear ? 1 : 0)
                .scaleEffect(appear ? 1 : 0.96)

                ValidatedTextField("Valor secreto", text: $savedValue)

                PrimaryButton("Salvar com biometria", isLoading: isLoading) {
                    Task { await save() }
                }
                .disabled(savedValue.isEmpty)

                PrimaryButton("Ler com biometria", isLoading: isLoading) {
                    Task { await load() }
                }

                if !loadedValue.isEmpty {
                    CardView {
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Valor recuperado")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            Text(loadedValue)
                                .font(.body.monospaced())
                        }
                    }
                    .transition(.asymmetric(
                        insertion: .scale(scale: 0.95).combined(with: .opacity),
                        removal: .opacity
                    ))
                }

                Text("No simulador a biometria pode ser simulada pelo menu Features → Face ID / Touch ID.")
                    .font(.caption2)
                    .foregroundStyle(.tertiary)
            }
            .padding()
            .animation(.spring(response: 0.4, dampingFraction: 0.8), value: loadedValue)
            .animation(.easeInOut(duration: 0.2), value: status)
        }
        .navigationTitle("Segurança")
        .onAppear {
            withAnimation(.easeOut(duration: 0.45)) {
                appear = true
            }
        }
    }

    private var biometricIcon: String {
        switch BiometricAuth.availableType {
        case .faceID: return "faceid"
        case .touchID: return "touchid"
        default: return "lock.shield"
        }
    }

    private func save() async {
        isLoading = true
        status = "Salvando…"
        defer { isLoading = false }

        do {
            try SecureStorage.saveWithBiometrics(savedValue, forKey: demoKey)
            status = "Salvo com sucesso"
            loadedValue = ""
            Haptic.success()
        } catch {
            status = error.localizedDescription
            Haptic.error()
        }
    }

    private func load() async {
        isLoading = true
        status = "Autenticando…"
        defer { isLoading = false }

        do {
            if let value = try SecureStorage.loadWithBiometrics(forKey: demoKey) {
                loadedValue = value
                status = "Lido com sucesso"
                Haptic.success()
            } else {
                status = "Nenhum valor encontrado"
                loadedValue = ""
            }
        } catch {
            status = error.localizedDescription
            loadedValue = ""
            Haptic.error()
        }
    }
}
