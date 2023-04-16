// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DesignSystem",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "DesignSystem",
            targets: ["DesignSystem"]
        )
    ],
    dependencies: [
        .package(name: "Core", path: "../Core"),
        .package(name: "Plugins", path: "../Plugins")
    ],
    targets: [
        .target(
            name: "DesignSystem",
            dependencies: [
                "Foundations",
                .product(name: "Entity", package: "Core")
            ],
            resources: [
                .process(".sourcery.yml")
            ],
            plugins: [
                .plugin(name: "SourceryPlugin", package: "Plugins")
            ]
        ),
        .target(
            name: "Foundations",
            dependencies: [
                .product(name: "Entity", package: "Core")
            ],
            resources: [
                .process("swiftgen.yml")
            ],
            plugins: [
                .plugin(name: "SwiftGenPlugin", package: "Plugins")
            ]
        )
    ]
)
