import SwiftUI
import SwiftUIKit

struct ComponentsDemoView: View {
    @State private var showToast = false
    @State private var appear = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                SectionHeader("Components", subtitle: "Botões, cards e toast")
                    .opacity(appear ? 1 : 0)
                    .offset(y: appear ? 0 : 6)

                PrimaryButton("Primary") {}
                    .opacity(appear ? 1 : 0)

                SecondaryButton("Secondary") {}
                    .opacity(appear ? 1 : 0)

                CardView {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("CardView")
                            .font(.headline)
                        Text("Conteúdo dentro de um card reutilizável.")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
                .opacity(appear ? 1 : 0)
                .scaleEffect(appear ? 1 : 0.98)

                PrimaryButton("Mostrar Toast") {
                    withAnimation(AnimationTiming.spring) {
                        showToast = true
                    }
                }

                if showToast {
                    ToastView(message: "Toast de exemplo", isPresented: $showToast)
                        .transition(.move(edge: .top).combined(with: .opacity))
                }
            }
            .padding()
            .animation(AnimationTiming.entrance, value: appear)
            .animation(AnimationTiming.spring, value: showToast)
        }
        .navigationTitle("Components")
        .onAppear { appear = true }
    }
}
