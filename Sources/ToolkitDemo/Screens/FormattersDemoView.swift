import SwiftUI
import SwiftToolkit
import SwiftUIKit

struct FormattersDemoView: View {
    private let amount = 1990.5
    private let now = Date()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                SectionHeader("Formatters", subtitle: "Currency, numbers and dates")

                CardView {
                    VStack(alignment: .leading, spacing: 12) {
                        row("Currency", Formatters.currency(amount))
                        row("From centavos", Formatters.currency(fromCentavos: 1990))
                        row("Number", Formatters.number(1234.56, fractionDigits: 2))
                        row("Date", now.brFormatted())
                        row("Relative", now.relativeFormatted())
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Formatters")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func row(_ title: String, _ value: String) -> some View {
        HStack {
            Text(title)
                .foregroundStyle(.secondary)
            Spacer()
            Text(value)
                .fontWeight(.medium)
        }
    }
}
