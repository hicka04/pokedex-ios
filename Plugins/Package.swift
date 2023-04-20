// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Plugins",
    products: [
        .plugin(name: "SourceryPlugin", targets: ["SourceryPlugin"])
    ],
    targets: [
        // Sourcery
        .binaryTarget(
            name: "sourcery",
            path: "Artifacts/sourcery.artifactbundle"
        ),
        .plugin(
            name: "SourceryPlugin",
            capability: .buildTool(),
            dependencies: ["sourcery"]
        )
    ]
)
