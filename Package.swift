// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "ToolkitDemo",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "ToolkitDemo",
            targets: ["ToolkitDemo"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/RknDEV1/swift-toolkit.git", branch: "main"),
        .package(url: "https://github.com/RknDEV1/swift-ui-kit.git", branch: "main")
    ],
    targets: [
        .target(
            name: "ToolkitDemo",
            dependencies: [
                .product(name: "SwiftToolkit", package: "swift-toolkit"),
                .product(name: "SwiftUIKit", package: "swift-ui-kit")
            ],
            path: "Sources/ToolkitDemo"
        ),
    ]
)
