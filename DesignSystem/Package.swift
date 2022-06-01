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
        .package(name: "Domain", path: "../Domain"),
        .package(name: "Core", path: "../Core")
    ],
    targets: [
        .binaryTarget(
            name: "swiftgen",
            path: "Artifacts/swiftgen.artifactbundle"
        ),
        .plugin(
            name: "SwiftGenPlugin",
            capability: .buildTool(),
            dependencies: ["swiftgen"]
        ),
        .target(
            name: "DesignSystem",
            dependencies: [
                .product(name: "Entity", package: "Domain"),
                "Core"
            ],
            resources: [
                .process("Resources")
            ],
            plugins: [
                .plugin(name: "SwiftGenPlugin")
            ]
        )
    ]
)
