import SwiftUI
import SwiftToolkit
import SwiftUIKit

struct SecureStorageDemoView: View {
    @State private var status = "Pronto"
    @State private var savedValue = ""
    @State private var loadedValue = ""
    @State private var isLoading = false

    private let demoKey = "demo-secret"

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                SectionHeader("Armazenamento seguro + Biometria")

                CardView {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: biometricIcon)
                                .font(.title2)
                                .foregroundStyle(BiometricAuth.isAvailable ? .green : .secondary)
                            VStack(alignment: .leading) {
                                Text(BiometricAuth.typeName)
                                    .font(.headline)
                                Text(BiometricAuth.isAvailable ? "Disponível" : "Não disponível")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }

                        Text("Status: \(status)")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }

                ValidatedTextField("Valor secreto", text: $savedValue)

                PrimaryButton("Salvar com biometria", isLoading: isLoading) {
                    Task { await save() }
                }
                .disabled(savedValue.isEmpty)

                PrimaryButton("Ler com biometria", isLoading: isLoading) {
                    Task { await load() }
                }

                if !loadedValue.isEmpty {
                    CardView {
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Valor recuperado")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            Text(loadedValue)
                                .font(.body.monospaced())
                        }
                    }
                }

                Text("No simulador a biometria pode ser simulada pelo menu Features → Face ID / Touch ID.")
                    .font(.caption2)
                    .foregroundStyle(.tertiary)
            }
            .padding()
        }
        .navigationTitle("Segurança")
    }

    private var biometricIcon: String {
        switch BiometricAuth.availableType {
        case .faceID: return "faceid"
        case .touchID: return "touchid"
        default: return "lock.shield"
        }
    }

    private func save() async {
        isLoading = true
        status = "Salvando…"
        defer { isLoading = false }

        do {
            try SecureStorage.saveWithBiometrics(savedValue, forKey: demoKey)
            status = "Salvo com sucesso"
            loadedValue = ""
        } catch {
            status = error.localizedDescription
        }
    }

    private func load() async {
        isLoading = true
        status = "Autenticando…"
        defer { isLoading = false }

        do {
            if let value = try SecureStorage.loadWithBiometrics(forKey: demoKey) {
                loadedValue = value
                status = "Lido com sucesso"
            } else {
                status = "Nenhum valor encontrado"
                loadedValue = ""
            }
        } catch {
            status = error.localizedDescription
            loadedValue = ""
        }
    }
}
