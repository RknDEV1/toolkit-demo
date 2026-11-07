import SwiftUI
import SwiftUIKit

public struct ContentView: View {
    public init() {}

    public var body: some View {
        NavigationStack {
            List {
                Section("Segurança") {
                    NavigationLink {
                        FaceIDLoginView()
                            .transition(.asymmetric(
                                insertion: .move(edge: .trailing).combined(with: .opacity),
                                removal: .move(edge: .leading).combined(with: .opacity)
                            ))
                    } label: {
                        Label("Login com Face ID", systemImage: "faceid")
                    }

                    NavigationLink {
                        SecureStorageDemoView()
                            .transition(.asymmetric(
                                insertion: .scale(scale: 0.96).combined(with: .opacity),
                                removal: .opacity
                            ))
                    } label: {
                        Label("Biometria + Keychain", systemImage: "lock.shield")
                    }
                }

                Section("Utilidade") {
                    NavigationLink {
                        NetworkDemoView()
                            .transition(.opacity.combined(with: .scale(scale: 0.98)))
                    } label: {
                        Label("Rede (loading / erro)", systemImage: "network")
                    }

                    NavigationLink {
                        ShareDemoView()
                            .transition(.move(edge: .bottom).combined(with: .opacity))
                    } label: {
                        Label("Compartilhar", systemImage: "square.and.arrow.up")
                    }

                    NavigationLink {
                        FeedbackDemoView()
                            .transition(.opacity)
                    } label: {
                        Label("Feedback (haptics)", systemImage: "waveform")
                    }
                }

                Section("Componentes") {
                    NavigationLink {
                        LoginDemoView()
                            .transition(.opacity)
                    } label: {
                        Label("Login simples", systemImage: "person")
                    }

                    NavigationLink {
                        FormattersDemoView()
                            .transition(.opacity)
                    } label: {
                        Label("Formatters", systemImage: "textformat")
                    }

                    NavigationLink {
                        ValidatorsDemoView()
                            .transition(.opacity)
                    } label: {
                        Label("Validators", systemImage: "checkmark.shield")
                    }

                    NavigationLink {
                        ComponentsDemoView()
                            .transition(.opacity)
                    } label: {
                        Label("Components", systemImage: "square.grid.2x2")
                    }
                }
            }
            .navigationTitle("Toolkit Demo")
        }
    }
}
