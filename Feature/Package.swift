// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Feature",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Features",
            targets: [
                "PokemonList",
                "PokemonDetail"
            ]
        )
    ],
    dependencies: [
        .package(name: "Core", path: "../Core"),
        .package(name: "DesignSystem", path: "../DesignSystem"),
        .package(url: "https://github.com/SFSafeSymbols/SFSafeSymbols.git", from: "2.1.3"),
        .package(url: "https://github.com/pointfreeco/swift-dependencies.git", from: "0.4.1"),
        .package(url: "https://github.com/realm/SwiftLint.git", from: "0.51.0")
    ],
    targets: [
        .target(
            name: "PokemonList",
            dependencies: [
                .product(name: "UseCase", package: "Core"),
                .product(name: "Entity", package: "Core"),
                .product(name: "UI", package: "Core"),
                .product(name: "Routing", package: "Core"),
                "DesignSystem",
                "SFSafeSymbols",
                .product(name: "Dependencies", package: "swift-dependencies")
            ],
            plugins: [
                .plugin(name: "SwiftLintPlugin", package: "SwiftLint")
            ]
        ),
        .target(
            name: "PokemonDetail",
            dependencies: [
                .product(name: "UseCase", package: "Core"),
                .product(name: "Entity", package: "Core"),
                .product(name: "UI", package: "Core"),
                .product(name: "Routing", package: "Core"),
                "DesignSystem",
                "SFSafeSymbols",
                .product(name: "Dependencies", package: "swift-dependencies")
            ],
            plugins: [
                .plugin(name: "SwiftLintPlugin", package: "SwiftLint")
            ]
        ),
        .testTarget(
            name: "FeatureTests",
            dependencies: [
                "PokemonList",
                "PokemonDetail"
            ],
            plugins: [
                .plugin(name: "SwiftLintPlugin", package: "SwiftLint")
            ]
        )
    ]
)
