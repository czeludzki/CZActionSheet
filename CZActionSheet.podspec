#
# Be sure to run `pod lib lint CZActionSheet.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CZActionSheet'
  s.version          = '0.2.3'
  s.summary          = 'A ActionSheet.'
  s.description      = "Just an actionSheet"

  s.homepage         = 'https://github.com/czeludzki/CZActionSheet'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'czeludzki' => 'czeludzki@gmail.com' }
  s.platform         = :ios
  s.ios.deployment_target = '8.0'

  s.source           = { :git => 'https://github.com/czeludzki/CZActionSheet.git', :tag => s.version.to_s }
  s.source_files = 'CZActionSheet/Classes/**/*'

  s.frameworks = 'UIKit'
  s.requires_arc = true
  s.dependency 'Masonry'

end
