import SwiftUI
import SwiftUIKit

struct ShareDemoView: View {
    @State private var text = "Aju Util — utilidades para Aracaju"
    @State private var showToast = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                SectionHeader("Compartilhar", subtitle: "Share Sheet nativo")

                ValidatedTextField("Texto para compartilhar", text: $text)

                ShareLink(item: text) {
                    Label("Compartilhar texto", systemImage: "square.and.arrow.up")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.accentColor.opacity(0.15))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }

                PrimaryButton("Copiar para área de transferência") {
                    #if canImport(UIKit)
                    UIPasteboard.general.string = text
                    #endif
                    showToast = true
                }

                if showToast {
                    ToastView(message: "Copiado!", isPresented: $showToast)
                }

                Text("Útil para contatos, endereços, códigos e links.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding()
        }
        .navigationTitle("Compartilhar")
    }
}
