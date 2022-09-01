// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Darwin

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
        .package(url: "https://github.com/ishkawa/APIKit.git", from: "5.2.0"),
        .package(url: "https://github.com/AliSoftware/OHHTTPStubs.git", from: "9.1.0")
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
            dependencies: [
                "Infra",
                .product(name: "OHHTTPStubsSwift", package: "OHHTTPStubs")
            ],
            resources: [
                .process("DataStores/Pokemon/Stubs")
            ]
        )
    ]
)
