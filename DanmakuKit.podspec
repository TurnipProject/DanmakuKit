#
# Be sure to run `pod lib lint DanmakuKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DanmakuKit'
  s.version          = '1.2.2'
  s.summary          = 'DanmakuKit is a tool for rapid development of danmaku functions.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  DanmakuKit is a high performance danmaku framework that you can use to customize your own unique danmaku style. It provides an asynchronous and synchronous way for you to draw a danmaku. And it provides three types of danmaku: floating, roof screens and floor screens.
                       DESC

  s.homepage         = 'https://github.com/qyz777/DanmakuKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'qyz777' => 'qyizhong1998@gmail.com' }
  s.source           = { :git => 'https://github.com/qyz777/DanmakuKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.swift_versions = ['5.0']

  s.source_files = 'DanmakuKit/Classes/**/*'
  
end
