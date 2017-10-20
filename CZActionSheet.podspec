#
# Be sure to run `pod lib lint CZActionSheet.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CZActionSheet'
  s.version          = '0.1.0'
  s.summary          = 'A ActionSheet.'

  s.description      = "just an actionSheet"

  s.homepage         = 'https://github.com/czeludzki/CZActionSheet'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'czeludzki' => 'czeludzki@gmail.com' }
  s.source           = { :git => 'https://github.com/czeludzki/CZActionSheet.git', :tag => s.version.to_s }

  s.platform = :ios
  s.ios.deployment_target = '8.0'

  s.source_files = 'CZActionSheet/Classes/**/*'
  s.requires_arc = true

  s.frameworks = 'UIKit'
  s.dependency 'Masonry'
end
