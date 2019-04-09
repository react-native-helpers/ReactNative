require "json"

Pod::Spec.new do |s|
  s.name = "ReactNative"
  s.version = "0.59.3"
  s.summary = "This library is a container of the react native depenecies."

  s.description = <<-DESC
    TODO: Add long description of the pod here.
    DESC

  s.homepage = "https://github.com/react-native-helpers/ReactNative"
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.author = { "barrault01" => "barrault01@gmail.com" }
  s.source = { :git => "git@github.com:react-native-helpers/ReactNative.git", :tag => s.version.to_s }

  s.ios.deployment_target = "9.0"

  s.dependency "React/Core", "0.59.3"
  s.dependency "React/CxxBridge", "0.59.3"
  s.dependency "React/RCTAnimation", "0.59.3"
  s.dependency "React/RCTImage", "0.59.3"
  s.dependency "React/RCTLinkingIOS", "0.59.3"
  s.dependency "React/RCTNetwork", "0.59.3"
  s.dependency "React/RCTText", "0.59.3"
  s.dependency "React/DevSupport", "0.59.3"

  s.dependency "yoga", "0.59.3.React"
  s.dependency "Folly", "2018.10.22.00"
  s.dependency "glog", "0.3.5"
end
