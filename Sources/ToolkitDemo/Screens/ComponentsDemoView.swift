import SwiftUI
import SwiftUIKit

struct ComponentsDemoView: View {
    @State private var isLoading = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                SectionHeader("Components", subtitle: "Buttons, cards and feedback")

                PrimaryButton("Primary Action", isLoading: isLoading) {
                    isLoading.toggle()
                }

                SecondaryButton("Secondary Action") {}

                CardView {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Card title")
                            .font(.headline)
                        Text("Reusable card container from swift-ui-kit.")
                            .foregroundStyle(.secondary)
                    }
                }

                ToastView("Everything looks good", systemImage: "checkmark.circle")
            }
            .padding()
        }
        .navigationTitle("Components")
    }
}
