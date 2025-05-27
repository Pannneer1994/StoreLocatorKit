
// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "StoreLocatorKit",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "StoreLocatorCore", targets: ["Core"]),
        .library(name: "StoreLocatorAnalytics", targets: ["Analytics"]),
        .library(name: "StoreLocatorConfig", targets: ["Config"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Core",
            dependencies: ["Analytics", "Config"],
            resources: [.process("Resources")]
        ),
        .target(
            name: "Analytics",
            dependencies: []
        ),
        .target(
            name: "Config",
            dependencies: []
        ),
    
        .testTarget(
            name: "CoreTests",
            dependencies: ["Core"]
        ),
        .testTarget(
            name: "AnalyticsTests",
            dependencies: ["Analytics"]
        ),
        .testTarget(
            name: "ConfigTests",
            dependencies: ["Config"]
        ),
]
)
