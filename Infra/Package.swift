// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Infra",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "Infra",
            targets: ["Infra"]
        ),
    ],
    dependencies: [
        .package(name: "Domain", path: "../Domain/"),
        .package(name: "APIKit", url: "https://github.com/ishkawa/APIKit.git", .upToNextMajor(from: "5.2.0"))
    ],
    targets: [
        .target(
            name: "Infra",
            dependencies: [
                .product(name: "Entity", package: "Domain"),
                .product(name: "Repository", package: "Domain"),
                "APIKit"
            ]
        ),
        .testTarget(
            name: "InfraTests",
            dependencies: ["Infra"]
        )
    ]
)
