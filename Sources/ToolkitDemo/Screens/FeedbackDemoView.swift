import SwiftUI
import SwiftToolkit
import SwiftUIKit

struct FeedbackDemoView: View {
    @State private var showToast = false
    @State private var toastMessage = ""
    @State private var appear = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                SectionHeader("Feedback", subtitle: "Haptics e toasts")
                    .opacity(appear ? 1 : 0)
                    .offset(y: appear ? 0 : 6)

                PrimaryButton("Haptic — Sucesso") {
                    trigger("Sucesso", haptic: Haptic.success)
                }
                .opacity(appear ? 1 : 0)

                PrimaryButton("Haptic — Aviso") {
                    trigger("Atenção", haptic: Haptic.warning)
                }
                .opacity(appear ? 1 : 0)

                PrimaryButton("Haptic — Erro") {
                    trigger("Erro", haptic: Haptic.error)
                }
                .opacity(appear ? 1 : 0)

                SecondaryButton("Haptic — Seleção") {
                    trigger("Selecionado", haptic: Haptic.selection)
                }
                .opacity(appear ? 1 : 0)

                if showToast {
                    ToastView(message: toastMessage, isPresented: $showToast)
                        .transition(.move(edge: .top).combined(with: .opacity))
                }

                Text("Feedback tátil melhora a percepção de qualidade do app.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .opacity(appear ? 1 : 0)
            }
            .padding()
            .animation(AnimationTiming.entrance, value: appear)
            .animation(AnimationTiming.spring, value: showToast)
        }
        .navigationTitle("Feedback")
        .onAppear { appear = true }
    }

    private func trigger(_ message: String, haptic: () -> Void) {
        haptic()
        toastMessage = message
        withAnimation(AnimationTiming.spring) {
            showToast = true
        }
    }
}
