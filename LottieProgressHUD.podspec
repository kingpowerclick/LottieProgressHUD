Pod::Spec.new do |s|

  s.name          = "LottieProgressHUD"
  s.version       = "2.0.0"
  s.summary       = "ProgressHUD using Lottie from Airbnb"
  s.homepage      = "https://github.com/kingpowerclick/LottieProgressHUD"
  s.license       = { :type => "MIT", :file => "License.md" }
  s.author        = { "Wipoo Shinsirikul" => "wipoo.shinsirikul@kingpower.com" }
  s.platform      = :ios, "13.0"
  s.swift_version = "5.5"
  s.source        = { :git => "https://github.com/kingpowerclick/LottieProgressHUD.git", :tag => "#{s.version}" }
  s.source_files  = "Sources/LottieProgressHUD/**/*.{swift}"

  s.dependency "lottie-ios"
 
end
