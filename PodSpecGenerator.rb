require "json"

pkg_version = lambda do |dir_from_root = "", version = "version"|
  path = File.join(__dir__, dir_from_root, "package.json")
  JSON.parse(File.read(path))[version]
end

react_native_version = pkg_version.call("node_modules/react-native")
git_url = pkg_version.call("", "repository")["url"]
homepage = pkg_version.call("", "homepage")

Pod::Spec.new do |s|
  s.name = "ReactNative"
  s.version = react_native_version
  s.summary = "This library is a container of the react native depenecies."

  s.description = <<-DESC
    TODO: Add long description of the pod here.
    DESC

  s.homepage = homepage
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.author = { "barrault01" => "barrault01@gmail.com" }
  s.source = { :git => git_url, :tag => s.version.to_s }

  s.ios.deployment_target = "9.0"

  s.dependency "React/Core", react_native_version
  s.dependency "React/CxxBridge", react_native_version
  s.dependency "React/RCTAnimation", react_native_version
  s.dependency "React/RCTImage", react_native_version
  s.dependency "React/RCTLinkingIOS", react_native_version
  s.dependency "React/RCTNetwork", react_native_version
  s.dependency "React/RCTText", react_native_version
  s.dependency "React/DevSupport", react_native_version

  s.dependency "yoga", "#{react_native_version}.React"

  podspecs = [
    "node_modules/react-native/third-party-podspecs/DoubleConversion.podspec",
    "node_modules/react-native/third-party-podspecs/Folly.podspec",
    "node_modules/react-native/third -party-podspecs/glog.podspec",
  ]

  podspecs.each do |podspec_path|
    spec = Pod::Specification.from_file podspec_path
    s.dependency spec.name, "#{spec.version}"
  end
end
