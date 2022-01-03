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
            name: "Usecase",
            targets: ["Usecase"]
        ),
        .library(
            name: "Repository",
            targets: ["Repository"]
        )
    ],
    targets: [
        .target(
            name: "Entity",
            path: "Sources/Entities"
        ),
        .target(
            name: "Usecase",
            path: "Sources/Usecases"
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
                "Usecase",
                "Repository"
            ]
        )
    ]
)
