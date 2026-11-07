import SwiftUI
import SwiftToolkit
import SwiftUIKit

struct NetworkDemoView: View {
    @State private var status = "Pronto"
    @State private var result = ""
    @State private var isLoading = false
    @State private var appear = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                SectionHeader("Rede", subtitle: "Estados de loading, sucesso e erro")
                    .opacity(appear ? 1 : 0)
                    .offset(y: appear ? 0 : 8)

                CardView {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            if isLoading {
                                ProgressView()
                            } else {
                                Image(systemName: statusIcon)
                                    .foregroundStyle(statusColor)
                                    .transition(.scale.combined(with: .opacity))
                            }
                            Text(status)
                                .font(.headline)
                        }

                        if !result.isEmpty {
                            Text(result)
                                .font(.caption.monospaced())
                                .foregroundStyle(.secondary)
                                .lineLimit(4)
                                .transition(.opacity.combined(with: .move(edge: .top)))
                        }
                    }
                }
                .opacity(appear ? 1 : 0)
                .scaleEffect(appear ? 1 : 0.97)

                PrimaryButton("Buscar JSON (sucesso)", isLoading: isLoading) {
                    Task { await fetchSuccess() }
                }

                SecondaryButton("Simular erro") {
                    Task { await fetchError() }
                }

                Text("Exemplo real de estados de rede que todo app precisa tratar.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .opacity(appear ? 1 : 0)
            }
            .padding()
            .animation(.spring(response: 0.35, dampingFraction: 0.8), value: status)
            .animation(.easeInOut(duration: 0.2), value: result)
        }
        .navigationTitle("Rede")
        .onAppear {
            withAnimation(.easeOut(duration: 0.4)) { appear = true }
        }
    }

    private var statusIcon: String {
        if status.contains("sucesso") { return "checkmark.circle.fill" }
        if status.contains("erro") || status.contains("falha") { return "xmark.circle.fill" }
        return "network"
    }

    private var statusColor: Color {
        if status.contains("sucesso") { return .green }
        if status.contains("erro") || status.contains("falha") { return .red }
        return .secondary
    }

    private func fetchSuccess() async {
        isLoading = true
        status = "Carregando…"
        result = ""
        defer { isLoading = false }

        try? await Task.sleep(nanoseconds: 800_000_000)

        status = "Sucesso"
        result = "{\n  \"id\": 1,\n  \"name\": \"Aracaju\",\n  \"status\": \"ok\"\n}"
        Haptic.success()
    }

    private func fetchError() async {
        isLoading = true
        status = "Carregando…"
        result = ""
        defer { isLoading = false }

        try? await Task.sleep(nanoseconds: 600_000_000)

        status = "Erro de rede"
        result = "Sem conexão ou servidor indisponível"
        Haptic.error()
    }
}
