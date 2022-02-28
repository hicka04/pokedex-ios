// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Feature",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "Feature",
            targets: ["Feature"]
        ),
        .library(
            name: "DI",
            targets: ["DI"]
        )
    ],
    dependencies: [
        .package(name: "Domain", path: "../Domain")
    ],
    targets: [
        .target(
            name: "Feature",
            dependencies: []
        ),
        .target(
            name: "DI",
            dependencies: [
                .product(name: "Entity", package: "Domain")
            ]
        ),
        .testTarget(
            name: "FeatureTests",
            dependencies: ["Feature"]
        )
    ]
)
