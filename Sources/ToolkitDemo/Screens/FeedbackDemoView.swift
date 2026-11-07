import SwiftUI
import SwiftToolkit
import SwiftUIKit

struct FeedbackDemoView: View {
    @State private var showToast = false
    @State private var toastMessage = ""

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                SectionHeader("Feedback", subtitle: "Haptics e toasts")

                PrimaryButton("Haptic — Sucesso") {
                    Haptic.success()
                    toastMessage = "Sucesso"
                    showToast = true
                }

                PrimaryButton("Haptic — Aviso") {
                    Haptic.warning()
                    toastMessage = "Atenção"
                    showToast = true
                }

                PrimaryButton("Haptic — Erro") {
                    Haptic.error()
                    toastMessage = "Erro"
                    showToast = true
                }

                SecondaryButton("Haptic — Seleção") {
                    Haptic.selection()
                    toastMessage = "Selecionado"
                    showToast = true
                }

                if showToast {
                    ToastView(message: toastMessage, isPresented: $showToast)
                }

                Text("Feedback tátil melhora a percepção de qualidade do app.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding()
        }
        .navigationTitle("Feedback")
    }
}
