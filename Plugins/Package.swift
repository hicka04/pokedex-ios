// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Plugins",
    products: [
        .plugin(name: "SourceryPlugin", targets: ["SourceryPlugin"]),
        .plugin(name: "SwiftGenPlugin", targets: ["SwiftGenPlugin"])
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
        ),
        // SwiftGen
        .binaryTarget(
            name: "swiftgen",
            path: "Artifacts/swiftgen.artifactbundle"
        ),
        .plugin(
            name: "SwiftGenPlugin",
            capability: .buildTool(),
            dependencies: ["swiftgen"]
        )
    ]
)
