# Toolkit Demo

App de demonstração que mostra o uso conjunto de **[swift-toolkit](https://github.com/RknDEV1/swift-toolkit)** e **[swift-ui-kit](https://github.com/RknDEV1/swift-ui-kit)**.

> English: [README.md](README.md)

## Telas

- **Login** – campos validados, botões, toast e haptics
- **Formatters** – moeda, números e datas (pt-BR)
- **Validators** – validação ao vivo de e-mail e CPF
- **Components** – botões, cards e toast

## Requisitos

- iOS 17+
- Xcode 15+
- Swift 5.9+

## Como rodar

### Opção A – Xcode

1. Clone este repositório
2. Crie um app iOS (SwiftUI)
3. Adicione os pacotes:
   - `https://github.com/RknDEV1/swift-toolkit.git`
   - `https://github.com/RknDEV1/swift-ui-kit.git`
4. Copie os arquivos de `Sources/ToolkitDemo` para o target do app
5. Compile e execute

### Opção B – Swift Package

```bash
git clone https://github.com/RknDEV1/toolkit-demo.git
cd toolkit-demo
swift build
```

## Dependências

| Pacote | Função |
|--------|--------|
| [swift-toolkit](https://github.com/RknDEV1/swift-toolkit) | Validadores, formatadores, Keychain, haptics, rede |
| [swift-ui-kit](https://github.com/RknDEV1/swift-ui-kit) | Botões, campos, cards, toasts, cabeçalhos |

## Licença

MIT
