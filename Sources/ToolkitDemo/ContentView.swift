import SwiftUI
import SwiftUIKit

public struct ContentView: View {
    public init() {}

    public var body: some View {
        NavigationStack {
            List {
                Section("Segurança") {
                    NavigationLink("Biometria + Keychain") {
                        SecureStorageDemoView()
                    }
                }

                Section("Utilidade") {
                    NavigationLink("Rede (loading / erro)") {
                        NetworkDemoView()
                    }
                    NavigationLink("Compartilhar") {
                        ShareDemoView()
                    }
                    NavigationLink("Feedback (haptics)") {
                        FeedbackDemoView()
                    }
                }

                Section("Componentes") {
                    NavigationLink("Login") {
                        LoginDemoView()
                    }
                    NavigationLink("Formatters") {
                        FormattersDemoView()
                    }
                    NavigationLink("Validators") {
                        ValidatorsDemoView()
                    }
                    NavigationLink("Components") {
                        ComponentsDemoView()
                    }
                }
            }
            .navigationTitle("Toolkit Demo")
        }
    }
}
