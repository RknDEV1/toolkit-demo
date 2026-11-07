# Toolkit Demo

Sample screens that showcase **[swift-toolkit](https://github.com/RknDEV1/swift-toolkit)** and **[swift-ui-kit](https://github.com/RknDEV1/swift-ui-kit)** together.

> Portuguese: [README.pt-BR.md](README.pt-BR.md)

## Screens

| Screen | What it shows |
|--------|----------------|
| **Segurança (Biometria)** | Face ID / Touch ID + Keychain protegido |
| Login | Validated fields, buttons, toast, haptics |
| Formatters | Currency, numbers, dates (pt-BR) |
| Validators | Live email and CPF checks |
| Components | Buttons, card, toast |

## Requirements

- iOS 17+
- Xcode 15+
- Swift 5.9+

## Run in Xcode (recommended)

1. **File → New → Project → App** (SwiftUI, iOS)
2. **File → Add Package Dependencies…**
   - `https://github.com/RknDEV1/swift-toolkit.git` → branch **main**
   - `https://github.com/RknDEV1/swift-ui-kit.git` → branch **main**
3. Copy the Swift files from `Sources/ToolkitDemo` into your app target
4. In your `@main` App, use:

```swift
WindowGroup {
    ContentView()
}
```

5. Build & Run on simulator or device

**Note:** On the simulator, use **Features → Face ID / Touch ID** to simulate biometrics.

## License

MIT
