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
        .package(name: "Environment", path: "../Environment"),
        .package(url: "https://github.com/SFSafeSymbols/SFSafeSymbols.git", .upToNextMajor(from: "2.1.3"))
    ],
    targets: [
        .target(
            name: "PokemonList",
            dependencies: [
                .product(name: "DI", package: "Environment"),
                .product(name: "Routing", package: "Environment"),
                "DesignSystem",
                "Core",
                "SFSafeSymbols"
            ]
        ),
        .target(
            name: "PokemonDetail",
            dependencies: [
                .product(name: "DI", package: "Environment"),
                .product(name: "Routing", package: "Environment"),
                "DesignSystem",
                "Core",
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
