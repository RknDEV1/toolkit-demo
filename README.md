# Toolkit Demo

Sample screens that showcase **[swift-toolkit](https://github.com/RknDEV1/swift-toolkit)** and **[swift-ui-kit](https://github.com/RknDEV1/swift-ui-kit)** together.

> Portuguese: [README.pt-BR.md](README.pt-BR.md)

## Screens

### Segurança
| Screen | What it shows |
|--------|----------------|
| Biometria + Keychain | Face ID / Touch ID + armazenamento protegido |

### Utilidade
| Screen | What it shows |
|--------|----------------|
| Rede | Estados de loading, sucesso e erro |
| Compartilhar | Share Sheet nativo + copiar |
| Feedback | Haptics (sucesso, aviso, erro) + toast |

### Componentes
| Screen | What it shows |
|--------|----------------|
| Login | Campos validados, botões, toast |
| Formatters | Moeda, números, datas |
| Validators | E-mail e CPF ao vivo |
| Components | Botões, cards, toast |

## Requirements

- iOS 17+
- Xcode 15+
- Swift 5.9+

## Run in Xcode

1. **File → New → Project → App** (SwiftUI)
2. Add packages (branch `main`):
   - `https://github.com/RknDEV1/swift-toolkit.git`
   - `https://github.com/RknDEV1/swift-ui-kit.git`
3. Copy files from `Sources/ToolkitDemo`
4. Use `ContentView()` as root

On simulator: **Features → Face ID / Touch ID** to test biometrics.

## License

MIT
