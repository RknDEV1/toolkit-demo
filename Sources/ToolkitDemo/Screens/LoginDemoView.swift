import SwiftUI
import SwiftToolkit
import SwiftUIKit

struct LoginDemoView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var emailError: String?
    @State private var isLoading = false
    @State private var showToast = false

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                SectionHeader(
                    "Welcome",
                    subtitle: "Sign in to continue"
                )

                VStack(spacing: 16) {
                    ValidatedTextField(
                        "Email",
                        text: $email,
                        errorMessage: emailError
                    )

                    ValidatedTextField(
                        "Password",
                        text: $password,
                        isSecure: true
                    )
                }

                PrimaryButton("Sign In", isLoading: isLoading) {
                    signIn()
                }

                SecondaryButton("Create Account") {}

                if showToast {
                    ToastView("Signed in successfully", systemImage: "checkmark.circle")
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                }
            }
            .padding()
        }
        .navigationTitle("Login")
    }

    private func signIn() {
        emailError = Validator.isValidEmail(email) ? nil : "Invalid email"
        guard emailError == nil, !password.isBlank else { return }

        isLoading = true

        Task {
            try? await Task.sleep(nanoseconds: 1_000_000_000)
            isLoading = false
            withAnimation { showToast = true }

            #if canImport(UIKit)
            Haptic.success()
            #endif

            try? await Task.sleep(nanoseconds: 2_000_000_000)
            withAnimation { showToast = false }
        }
    }
}
