// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Domain",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "Entity",
            targets: ["Entity"]
        ),
        .library(
            name: "UseCase",
            targets: ["UseCase"]
        ),
        .library(
            name: "Repository",
            targets: ["Repository"]
        )
    ],
    dependencies: [
        .package(name: "Plugins", path: "../Plugins")
    ],
    targets: [
        .target(
            name: "Entity",
            path: "Sources/Entities"
        ),
        .target(
            name: "UseCase",
            dependencies: [
                "Entity",
                "Repository"
            ],
            path: "Sources/UseCases"
        ),
        .target(
            name: "Repository",
            dependencies: [
                "Entity"
            ],
            path: "Sources/Repositories"
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
        )
    ]
)
