// swift-tools-version:5.10
import PackageDescription

let package = Package(
    name: "JSONUtils",
    platforms: [
        .iOS(.v12), .macOS(.v10_15), .watchOS(.v7)  
    ],
    products: [
        .library(
            name: "JSONUtils",
            targets: ["JSONUtils"]
        ),
    ],
    targets: [
        .target(
            name: "JSONUtils",
            dependencies: [],
            path: "Sources",
            publicHeadersPath: "JSONUtils/include",
            swiftSettings: [
                .define("SWIFT_PACKAGE")
            ]
        ),
    ]
)
