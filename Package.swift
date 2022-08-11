// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "LottieProgressHUD",
    platforms: [
        .iOS(.v11),
        .tvOS(.v11),
        .watchOS(.v4) ],
    products: [
        .library(
            name: "LottieProgressHUD",
            targets: [ "LottieProgressHUD" ]),
        .library(
            name: "LottieProgressHUD-Dynamic",
            type: .dynamic,
            targets: [ "LottieProgressHUD" ]) ],
    dependencies: [
        .package(
            name: "Lottie",
            url: "https://github.com/airbnb/lottie-ios",
            .upToNextMajor(from: "3.0.0")) ],
    targets: [
        .target(
            name: "LottieProgressHUD",
            dependencies: [
                "Lottie" ]),
        .testTarget(
            name: "LottieProgressHUDTests",
            dependencies: [ "LottieProgressHUD" ]) ],
    swiftLanguageVersions: [ .v5 ])
