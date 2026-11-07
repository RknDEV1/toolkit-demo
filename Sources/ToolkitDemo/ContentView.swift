import SwiftUI
import SwiftUIKit

public struct ContentView: View {
    public init() {}

    public var body: some View {
        NavigationStack {
            List {
                Section("Segurança") {
                    NavigationLink("Login com Face ID") {
                        FaceIDLoginView()
                            .transition(.opacity)
                    }
                    NavigationLink("Biometria + Keychain") {
                        SecureStorageDemoView()
                            .transition(.opacity)
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
                    NavigationLink("Login simples") {
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
