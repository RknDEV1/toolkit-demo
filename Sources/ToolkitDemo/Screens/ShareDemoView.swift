import SwiftUI
import SwiftUIKit

struct ShareDemoView: View {
    @State private var text = "Aju Util — utilidades para Aracaju"
    @State private var showToast = false
    @State private var appear = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                SectionHeader("Compartilhar", subtitle: "Share Sheet nativo")
                    .opacity(appear ? 1 : 0)
                    .offset(y: appear ? 0 : 6)

                ValidatedTextField("Texto para compartilhar", text: $text)
                    .opacity(appear ? 1 : 0)

                ShareLink(item: text) {
                    Label("Compartilhar texto", systemImage: "square.and.arrow.up")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.accentColor.opacity(0.15))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .opacity(appear ? 1 : 0)
                .scaleEffect(appear ? 1 : 0.98)

                PrimaryButton("Copiar para área de transferência") {
                    #if canImport(UIKit)
                    UIPasteboard.general.string = text
                    #endif
                    withAnimation(AnimationTiming.spring) {
                        showToast = true
                    }
                    Haptic.success()
                }

                if showToast {
                    ToastView(message: "Copiado!", isPresented: $showToast)
                        .transition(.move(edge: .top).combined(with: .opacity))
                }

                Text("Útil para contatos, endereços, códigos e links.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .opacity(appear ? 1 : 0)
            }
            .padding()
            .animation(AnimationTiming.entrance, value: appear)
        }
        .navigationTitle("Compartilhar")
        .onAppear { appear = true }
    }
}
