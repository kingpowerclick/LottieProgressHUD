# LottieProgressHUD
[![pod](https://img.shields.io/cocoapods/v/LottieProgressHUD.svg)](https://cocoapods.org/pods/LottieProgressHUD) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

ProgressHUD using [Lottie](https://github.com/airbnb/lottie-ios) from Airbnb

## Installation

### CocoaPods

```rb
pod 'LottieProgressHUD'
```

### Carthage

```
github "kingpowerclick/LottieProgressHUD"
```

## Usage

### Quick Start

```swift
import Lottie
import LottieProgressHUD

class AppDelegate: UIResponder, UIApplicationDelegate
{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        if let progressAnimation = Animation.named("progress-animation.json")
        {
            ProgressHUD.register(animation: progressAnimation)
        }
        else
        {
            fatalError("Unable to find the animation file")
        }
 
        return true
    }
}

class ViewController: UIViewController
{
    private func buttonDidTap()
    {
        ProgressHUD.show()

        someAsyncOps(
            completion: {
                ProgressHUD.dismiss() })
    }
}
```

for more information about Lottie [click here](https://github.com/airbnb/lottie-ios)