import SwiftUI
import SwiftToolkit
import SwiftUIKit

struct ValidatorsDemoView: View {
    @State private var email = ""
    @State private var cpf = ""
    @State private var appear = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                SectionHeader("Validators", subtitle: "E-mail e CPF ao vivo")
                    .opacity(appear ? 1 : 0)
                    .offset(y: appear ? 0 : 6)

                ValidatedTextField(
                    "E-mail",
                    text: $email,
                    errorMessage: email.isEmpty ? nil : (Validator.isValidEmail(email) ? nil : "E-mail inválido")
                )
                .opacity(appear ? 1 : 0)

                ValidatedTextField(
                    "CPF",
                    text: $cpf,
                    errorMessage: cpf.isEmpty ? nil : (Validator.isValidCPF(cpf) ? nil : "CPF inválido")
                )
                .opacity(appear ? 1 : 0)

                if !email.isEmpty || !cpf.isEmpty {
                    CardView {
                        VStack(alignment: .leading, spacing: 6) {
                            statusRow("E-mail", valid: Validator.isValidEmail(email))
                            statusRow("CPF", valid: Validator.isValidCPF(cpf))
                        }
                    }
                    .transition(.opacity.combined(with: .move(edge: .top)))
                }
            }
            .padding()
            .animation(AnimationTiming.entrance, value: appear)
            .animation(AnimationTiming.quick, value: email)
            .animation(AnimationTiming.quick, value: cpf)
        }
        .navigationTitle("Validators")
        .onAppear { appear = true }
    }

    private func statusRow(_ title: String, valid: Bool) -> some View {
        HStack {
            Text(title)
            Spacer()
            Image(systemName: valid ? "checkmark.circle.fill" : "xmark.circle.fill")
                .foregroundStyle(valid ? .green : .red)
                .transition(.scale.combined(with: .opacity))
        }
    }
}
