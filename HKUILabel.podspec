# Podspec for HKUILabel
#   Created by Harrison Kong on 2020/02/05

Pod::Spec.new do |s|

  platform                = :ios
  s.ios.deployment_target = '8.0'

  s.name          = 'HKUILabel'
  s.summary       = 'HK Enhanced UILabel'
  s.requires_arc  = true
  s.version       = '1.0.0'
  s.license       = { :type => 'MIT' }
  s.author        = { 'Harrison Kong' => 'harrisonkong@skyroute66.com' }
  s.homepage      = 'https://github.com/harrisonkong/HKUILabel'
  s.source        = { :git => 'https://github.com/harrisonkong/HKUILabel.git',
                      :tag => '1.0.0' }
  s.dependency      'HKUIViewLengthCalculationBasis', '~> 1.0.0'
  s.dependency      'HKUIViewUtilities', '~> 1.0.0'
  s.framework     = 'UIKit'
  s.source_files  = 'HKUILabel/**/*.swift'
  s.swift_version = '4.0'

end
