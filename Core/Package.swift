// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Core",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "Entity",
            targets: [
                "Entity",
                "PreviewData"
            ]
        ),
        .library(
            name: "UseCase",
            targets: [
                "UseCase",
                "UseCaseContainer"
            ]
        )
    ],
    dependencies: [
        .package(name: "Plugins", path: "../Plugins"),
        .package(url: "https://github.com/pointfreeco/swift-dependencies.git", from: "0.4.1"),
        // Infra
        .package(url: "https://github.com/ishkawa/APIKit.git", from: "5.2.0"),
        .package(url: "https://github.com/AliSoftware/OHHTTPStubs.git", from: "9.1.0")
    ],
    targets: [
        // Entity
        .target(
            name: "Entity",
            path: "Sources/Entities"
        ),
        .target(
            name: "PreviewData",
            dependencies: [
                "Entity"
            ]
        ),
        // Domain
        .target(
            name: "UseCase",
            dependencies: [
                "Entity",
                "Repository",
                "RepositoryContainer",
                .product(name: "Dependencies", package: "swift-dependencies")
            ],
            path: "Sources/UseCases"
        ),
        .target(
            name: "UseCaseContainer",
            dependencies: [
                "UseCase",
                .product(name: "Dependencies", package: "swift-dependencies")
            ]
        ),
        .target(
            name: "Repository",
            dependencies: [
                "Entity"
            ],
            path: "Sources/Repositories"
        ),
        .target(
            name: "RepositoryContainer",
            dependencies: [
                "Repository",
                "Infra",
                .product(name: "Dependencies", package: "swift-dependencies")
            ]
        ),
        .testTarget(
            name: "DomainTests",
            dependencies: [
                "Entity",
                "UseCase",
                "Repository"
            ],
            resources: [
                .process(".sourcery.yml")
            ],
            plugins: [
                .plugin(name: "SourceryPlugin", package: "Plugins")
            ]
        ),
        // Infra
        .target(
            name: "Infra",
            dependencies: [
                "Entity",
                "Repository",
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
