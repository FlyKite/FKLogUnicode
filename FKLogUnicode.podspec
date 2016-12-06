Pod::Spec.new do |s|
  s.name         = "FKLogUnicode"
  s.version      = "1.0.0"
  s.summary      = "A util to replace unicode char to Chinese when you use NSLog."
  s.homepage     = "https://github.com/FlyKite/FKLogUnicode"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "FlyKite" => "DogeFlyKite@gmail.com" }
  s.social_media_url   = "http://blog.fly-kite.com"
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/FlyKite/FKLogUnicode.git", :tag => "#{s.version}" }
  s.requires_arc = true
  s.source_files  = "FKLogUnicode/*.{m}"
end
