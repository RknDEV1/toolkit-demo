# Toolkit Demo

Sample app that showcases **[swift-toolkit](https://github.com/RknDEV1/swift-toolkit)** and **[swift-ui-kit](https://github.com/RknDEV1/swift-ui-kit)** working together.

> Portuguese: [README.pt-BR.md](README.pt-BR.md)

## Screens

- **Login** – validated fields, primary/secondary buttons, toast and haptics
- **Formatters** – currency, numbers and dates (pt-BR)
- **Validators** – email and CPF live validation
- **Components** – buttons, cards and toast

## Requirements

- iOS 17+
- Xcode 15+
- Swift 5.9+

## How to run

### Option A – Xcode

1. Clone this repository
2. Create a new iOS App project (SwiftUI)
3. Add the packages (branch `main` or a future version tag):
   - `https://github.com/RknDEV1/swift-toolkit.git`
   - `https://github.com/RknDEV1/swift-ui-kit.git`
4. Copy the files from `Sources/ToolkitDemo` into your app target
5. Set the app entry to `ContentView()`
6. Build and run

### Option B – Swift Package

```bash
git clone https://github.com/RknDEV1/toolkit-demo.git
cd toolkit-demo
swift build
```

## Dependencies

| Package | Role |
|---------|------|
| [swift-toolkit](https://github.com/RknDEV1/swift-toolkit) | Validators, formatters, Keychain, haptics, networking |
| [swift-ui-kit](https://github.com/RknDEV1/swift-ui-kit) | Buttons, text fields, cards, toasts, headers |

## License

MIT
