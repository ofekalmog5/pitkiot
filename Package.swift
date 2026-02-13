// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "Pitkiot",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Pitkiot",
            targets: ["Pitkiot"]
        )
    ],
    targets: [
        .target(
            name: "Pitkiot",
            dependencies: [],
            path: "HebrewAlias"
        )
    ]
)
