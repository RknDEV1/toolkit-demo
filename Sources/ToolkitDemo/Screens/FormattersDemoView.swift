import SwiftUI
import SwiftToolkit
import SwiftUIKit

struct FormattersDemoView: View {
    @State private var value: Double = 19.9
    @State private var appear = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                SectionHeader("Formatters", subtitle: "Moeda e números (pt-BR)")
                    .opacity(appear ? 1 : 0)
                    .offset(y: appear ? 0 : 8)

                CardView {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Moeda")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        Text(Formatters.currency(value))
                            .font(.title2.monospaced())
                            .contentTransition(.numericText())
                    }
                }
                .opacity(appear ? 1 : 0)

                Slider(value: $value, in: 0...1000)
                    .opacity(appear ? 1 : 0)

                CardView {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Número")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        Text(Formatters.number(value, fractionDigits: 2))
                            .font(.title3.monospaced())
                            .contentTransition(.numericText())
                    }
                }
                .opacity(appear ? 1 : 0)
            }
            .padding()
            .animation(.easeOut(duration: 0.4), value: appear)
            .animation(.easeInOut(duration: 0.2), value: value)
        }
        .navigationTitle("Formatters")
        .onAppear { appear = true }
    }
}
