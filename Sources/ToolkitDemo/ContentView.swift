import SwiftUI
import SwiftUIKit

public struct ContentView: View {
    public init() {}

    public var body: some View {
        NavigationStack {
            List {
                NavigationLink("Segurança (Biometria)") {
                    SecureStorageDemoView()
                }
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
            .navigationTitle("Toolkit Demo")
        }
    }
}
