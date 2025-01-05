// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "AppleMapsSdk",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "AppleMapsSdk",
            targets: ["appleMapsSdkPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", branch: "main")
    ],
    targets: [
        .target(
            name: "appleMapsSdkPlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Sources/appleMapsSdkPlugin"),
        .testTarget(
            name: "appleMapsSdkPluginTests",
            dependencies: ["appleMapsSdkPlugin"],
            path: "ios/Tests/appleMapsSdkPluginTests")
    ]
)