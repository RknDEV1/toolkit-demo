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
                    .offset(y: appear ? 0 : 8)

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
                .scaleEffect(appear ? 1 : 0.97)

                PrimaryButton("Mostrar Toast") {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.75)) {
                        showToast = true
                    }
                }

                if showToast {
                    ToastView(message: "Toast de exemplo", isPresented: $showToast)
                        .transition(.move(edge: .top).combined(with: .opacity))
                }
            }
            .padding()
            .animation(.easeOut(duration: 0.4), value: appear)
            .animation(.spring(response: 0.3, dampingFraction: 0.75), value: showToast)
        }
        .navigationTitle("Components")
        .onAppear { appear = true }
    }
}
