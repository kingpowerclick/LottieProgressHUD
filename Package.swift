// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "LottieProgressHUD",
    platforms: [
        .iOS(.v14),
        .tvOS(.v14),
        .watchOS(.v7) ],
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
            url: "https://github.com/airbnb/lottie-ios",
            .upToNextMajor(from: "4.0.0")) ],
    targets: [
        .target(
            name: "LottieProgressHUD",
            dependencies: [
                .product(name: "Lottie", package: "lottie-ios") ]),
        .testTarget(
            name: "LottieProgressHUDTests",
            dependencies: [ "LottieProgressHUD" ]) ],
    swiftLanguageVersions: [ .v5 ])
