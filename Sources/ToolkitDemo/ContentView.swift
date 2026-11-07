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
                            .navigationTransition(.zoom(sourceID: "faceid", in: namespace))
                    } label: {
                        Label("Login com Face ID", systemImage: "faceid")
                    }
                    .matchedTransitionSource(id: "faceid", in: namespace)

                    NavigationLink {
                        SecureStorageDemoView()
                            .transition(.asymmetric(
                                insertion: .move(edge: .trailing).combined(with: .opacity),
                                removal: .move(edge: .leading).combined(with: .opacity)
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
            .navigationDestination(for: String.self) { _ in
                EmptyView()
            }
        }
        .animation(.spring(response: 0.4, dampingFraction: 0.85), value: UUID())
    }

    @Namespace private var namespace
}
