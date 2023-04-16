// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Environment",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "Routing",
            targets: ["Routing"]
        )
    ],
    dependencies: [
        .package(name: "Core", path: "../Core")
    ],
    targets: [
        .target(
            name: "Routing",
            dependencies: [
                .product(name: "Entity", package: "Core")
            ]
        )
    ]
)
