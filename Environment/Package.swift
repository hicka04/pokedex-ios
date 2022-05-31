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
            name: "DI",
            targets: ["DI"]
        ),
        .library(
            name: "Routing",
            targets: ["Routing"]
        )
    ],
    dependencies: [
        .package(name: "Domain", path: "../Domain"),
        .package(name: "Infra", path: "../Infra")
    ],
    targets: [
        .target(
            name: "DI",
            dependencies: [
                .product(name: "Entity", package: "Domain"),
                .product(name: "UseCase", package: "Domain"),
                .product(name: "Repository", package: "Domain"),
                "Infra"
            ]
        ),
        .target(
            name: "Routing",
            dependencies: [
                .product(name: "Entity", package: "Domain")
            ]
        )
    ]
)
