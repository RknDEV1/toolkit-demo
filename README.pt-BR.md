# Toolkit Demo

Telas de exemplo usando **[swift-toolkit](https://github.com/RknDEV1/swift-toolkit)** e **[swift-ui-kit](https://github.com/RknDEV1/swift-ui-kit)** juntos.

> English: [README.md](README.md)

## Telas

| Tela | O que mostra |
|------|----------------|
| Login | Campos validados, botões, toast, haptics |
| Formatters | Moeda, números, datas (pt-BR) |
| Validators | E-mail e CPF ao vivo |
| Components | Botões, card, toast |

## Requisitos

- iOS 17+
- Xcode 15+
- Swift 5.9+

## Como rodar no Xcode (recomendado)

1. **File → New → Project → App** (SwiftUI, iOS)
2. **File → Add Package Dependencies…**
   - `https://github.com/RknDEV1/swift-toolkit.git` → branch **main**
   - `https://github.com/RknDEV1/swift-ui-kit.git` → branch **main**
3. Copie os arquivos de `Sources/ToolkitDemo` para o target do app
4. No App `@main`, use:

```swift
WindowGroup {
    ContentView()
}
```

5. Compile e execute no simulador ou no iPhone

## Sobre o CI

O CI deste repositório foi desativado porque o GitHub cancelava os jobs macOS antes de iniciar (limite da conta ou permissões do Actions).  
A qualidade dos pacotes continua coberta por:

- https://github.com/RknDEV1/swift-toolkit/actions
- https://github.com/RknDEV1/swift-ui-kit/actions

## Licença

MIT
