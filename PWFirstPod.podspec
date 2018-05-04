#
#  Be sure to run `pod spec lint PWFirstPod.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

    s.name         = "PWFirstPod"
    s.version      = "0.0.4"
    s.summary      = "first public pod"
    s.homepage     = "https://github.com/YlyerChen/PWFirstPod.git"
    s.author       = "chenpeiwei"

    s.license      = "MIT"
    s.platform     = :ios, "9.0"
    s.source       = { :git => "https://github.com/YlyerChen/PWFirstPod.git", :tag => "#{s.version}" }

    # s.source_files  = "WaterMark", "WaterMark/*.{h,m}"
    s.source_files  = "PWWaterMark/**/*.{h,m}"
    # s.public_header_files = "WaterMark/*.h"

    s.frameworks = "UIKit", "Foundation"

    # s.dependency "JSONKit", "~> 1.4"
    s.dependency "AFNetworking"

end
