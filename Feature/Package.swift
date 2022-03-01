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
        .package(url: "https://github.com/SFSafeSymbols/SFSafeSymbols.git", .upToNextMajor(from: "2.1.3"))
    ],
    targets: [
        .target(
            name: "PokemonList",
            dependencies: [
                "SFSafeSymbols",
                "DI"
            ]
        ),
        .target(
            name: "PokemonDetail",
            dependencies: [
                "SFSafeSymbols",
                "DI"
            ]
        ),
        .target(
            name: "DI",
            dependencies: [
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
