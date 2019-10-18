#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_blue.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_blue'
  s.version          = '0.0.1'
  s.summary          = 'A new flutter plugin project.'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '8.0'
  s.framework = 'CoreBluetooth'

  s.subspec 'Protos' do |ss|
    ss.source_files = 'gen/**/*.pbobjc.{h,m}'
    ss.header_mappings_dir = '.'
    ss.requires_arc = false
    ss.dependency 'Protobuf'
  end

  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS=1',
            'USER_HEADER_SEARCH_PATHS' => '$SRCROOT/..',
            'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64', }

end
