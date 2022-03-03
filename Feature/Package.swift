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
        ),
        .library(
            name: "DI",
            targets: ["DI"]
        )
    ],
    dependencies: [
        .package(name: "Domain", path: "../Domain"),
        .package(name: "Core", path: "../Core"),
        .package(name: "DesignSystem", path: "../DesignSystem"),
        .package(url: "https://github.com/SFSafeSymbols/SFSafeSymbols.git", .upToNextMajor(from: "2.1.3")),
        .package(url: "https://github.com/uber/needle.git", .upToNextMajor(from: "0.17.2"))
    ],
    targets: [
        .target(
            name: "PokemonList",
            dependencies: [
                "DI",
                "DesignSystem",
                "Core",
                "SFSafeSymbols"
            ]
        ),
        .target(
            name: "PokemonDetail",
            dependencies: [
                "DI",
                "DesignSystem",
                "Core",
                "SFSafeSymbols",
            ]
        ),
        .target(
            name: "DI",
            dependencies: [
                .product(name: "NeedleFoundation", package: "Needle"),
                .product(name: "Entity", package: "Domain"),
                .product(name: "UseCase", package: "Domain"),
                .product(name: "Repository", package: "Domain")
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
