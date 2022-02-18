// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DesignSystem",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "DesignSystem",
            targets: ["DesignSystem"]
        )
    ],
    dependencies: [
        .package(name: "Domain", path: "../Domain")
    ],
    targets: [
        .target(
            name: "DesignSystem",
            dependencies: [
                .product(name: "Entity", package: "Domain")
            ]
        )
    ]
)
