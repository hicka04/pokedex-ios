// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Feature",
    products: [
        .library(
            name: "Feature",
            targets: ["Feature"]
        )
    ],
    dependencies: [
        .package(name: "Domain", path: "../Domain"),
        .package(name: "Core", path: "../Core")
    ],
    targets: [
        .target(
            name: "Feature",
            dependencies: []
        ),
        .testTarget(
            name: "FeatureTests",
            dependencies: ["Feature"]
        )
    ]
)
