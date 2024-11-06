Pod::Spec.new do |spec|

  spec.name         = "DeclarativeLayoutKit"
  spec.version      = "3.0.4"
  spec.summary      = "UIKit declarative layout like SwiftUI."
  spec.homepage     = "https://github.com/NosovPavel/DeclarativeLayoutKit"
  spec.license      = { :type => "MIT", :file => "LICENSE.md" }
  spec.author       = { "Ernest" => "magatar136@yandex.ru" }

  spec.platform     = :ios
  spec.ios.deployment_target = '16.0'
  spec.swift_versions = '5.4'

  spec.source_files  = "Sources/DeclarativeLayoutKit/**/*.swift"

  spec.source  = {
    :git => "https://github.com/NosovPavel/DeclarativeLayoutKit",
    :branch => "master",
    :tag => "#{spec.version}"
   }
end
