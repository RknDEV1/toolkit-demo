import SwiftUI
import SwiftToolkit
import SwiftUIKit

struct NetworkDemoView: View {
    @State private var status = "Pronto"
    @State private var result = ""
    @State private var isLoading = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                SectionHeader("Rede", subtitle: "Estados de loading, sucesso e erro")

                CardView {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            if isLoading {
                                ProgressView()
                            } else {
                                Image(systemName: statusIcon)
                                    .foregroundStyle(statusColor)
                            }
                            Text(status)
                                .font(.headline)
                        }

                        if !result.isEmpty {
                            Text(result)
                                .font(.caption.monospaced())
                                .foregroundStyle(.secondary)
                                .lineLimit(4)
                        }
                    }
                }

                PrimaryButton("Buscar JSON (sucesso)", isLoading: isLoading) {
                    Task { await fetchSuccess() }
                }

                SecondaryButton("Simular erro") {
                    Task { await fetchError() }
                }

                Text("Exemplo real de estados de rede que todo app precisa tratar.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding()
        }
        .navigationTitle("Rede")
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
    }

    private func fetchError() async {
        isLoading = true
        status = "Carregando…"
        result = ""
        defer { isLoading = false }

        try? await Task.sleep(nanoseconds: 600_000_000)

        status = "Erro de rede"
        result = "Sem conexão ou servidor indisponível"
    }
}
