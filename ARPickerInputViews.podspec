#
#  Be sure to run `pod spec lint ARPickerInputViews.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "ARPickerInputViews"
  s.version      = "1.0.0"
  s.summary      = "A set of pickers that can easily be used as input views for a UITextField."
  s.description  = <<-DESC
  					A set of pickers that can easily be used as input views for a UITextField.
                   DESC

  s.homepage         = "https://github.com/aderussell/ARPickerInputViews"
  # s.screenshots      = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
  s.license          = 'MIT'
  s.author           = { "aderussell" => "adrianrussell@me.com" }
  s.social_media_url = 'https://twitter.com/ade177'

  s.source       = { :git => "https://github.com/aderussell/ARPickerInputViews.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'ARPickerInputViews/*'
  s.frameworks = 'UIKit'

end
