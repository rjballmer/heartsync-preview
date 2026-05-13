// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "HeartSync",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(name: "HeartSyncCore", targets: ["HeartSyncCore"])
    ],
    targets: [
        .target(name: "HeartSyncCore"),
        .testTarget(name: "HeartSyncCoreTests", dependencies: ["HeartSyncCore"])
    ]
)
