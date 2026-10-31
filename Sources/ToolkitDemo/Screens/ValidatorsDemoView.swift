import SwiftUI
import SwiftToolkit
import SwiftUIKit

struct ValidatorsDemoView: View {
    @State private var email = "user@example.com"
    @State private var cpf = "390.533.447-05"

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                SectionHeader("Validators", subtitle: "Email and CPF")

                CardView {
                    VStack(alignment: .leading, spacing: 16) {
                        ValidatedTextField("Email", text: $email)
                        status(
                            "Email valid",
                            Validator.isValidEmail(email)
                        )

                        ValidatedTextField("CPF", text: $cpf)
                        status(
                            "CPF valid",
                            Validator.isValidCPF(cpf)
                        )
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Validators")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func status(_ title: String, _ ok: Bool) -> some View {
        HStack {
            Text(title)
            Spacer()
            Image(systemName: ok ? "checkmark.circle.fill" : "xmark.circle.fill")
                .foregroundStyle(ok ? .green : .red)
        }
    }
}
