Pod::Spec.new do |s|

  s.name          = "LottieProgressHUD"
  s.version       = "1.0.2"
  s.summary       = "ProgressHUD using Lottie from Airbnb"
  s.homepage      = "https://github.com/kingpowerclick/LottieProgressHUD"
  s.license       = { :type => "MIT", :file => "License.md" }
  s.author        = { "Wipoo Shinsirikul" => "wipoo.shinsirikul@kingpower.com" }
  s.platform      = :ios, "10.0"
  s.swift_version = "5.0"
  s.source        = { :git => "https://github.com/kingpowerclick/LottieProgressHUD.git", :tag => "#{s.version}" }
  s.source_files  = "LottieProgressHUD/**/*.{swift}"

  s.dependency "lottie-ios"
 
end
