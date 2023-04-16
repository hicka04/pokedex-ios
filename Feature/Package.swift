// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Feature",
    platforms: [
        .iOS(.v15)
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
        .package(url: "https://github.com/SFSafeSymbols/SFSafeSymbols.git", from: "2.1.3")
    ],
    targets: [
        .target(
            name: "PokemonList",
            dependencies: [
                .product(name: "UseCase", package: "Core"),
                .product(name: "Entity", package: "Core"),
                .product(name: "Routing", package: "Core"),
                "DesignSystem",
                "SFSafeSymbols"
            ]
        ),
        .target(
            name: "PokemonDetail",
            dependencies: [
                .product(name: "UseCase", package: "Core"),
                .product(name: "Entity", package: "Core"),
                .product(name: "Routing", package: "Core"),
                "DesignSystem",
                "SFSafeSymbols",
            ]
        ),
        .testTarget(
            name: "FeatureTests",
            dependencies: [
                "PokemonList",
                "PokemonDetail"
            ]
        )
    ]
)
