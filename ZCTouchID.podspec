Pod::Spec.new do |s|

# Spec Meta Data
  s.name         = "ZCTouchID"
  s.version      = "1.0.0"
  s.summary      = "一行代码在你的App中加入TouchID指纹验证"
  s.homepage     = "https://github.com/zcill/ZCTouchID"

# Spec License
  s.license      = "MIT"

# Author Meta Data
  s.author       = { "zcill" => "zcillcoder@gmail.com" }
  s.platform     = :ios, "8.0"

# Source Location
  s.source       = { :git => "https://github.com/zcill/ZCTouchID.git", :tag => "#{s.version}" }
  s.source_files = 'ZCTouchID/*.{h,m}'

# Project Linking
  s.frameworks	 = 'Foundation', 'UIKit', 'LocalAuthentication'

# Project Setting
  s.requires_arc = true

end
