#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_blue.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_blue'
  s.version          = '0.0.1'
  s.summary          = 'Bluetooth Low Energy plugin for Flutter.'
  s.description      = <<-DESC
Bluetooth Low Energy plugin for Flutter.
                      DESC
  s.homepage         = 'https://github.com/pauldemarco/flutter_blue'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Paul DeMarco' => 'paulmdemarco@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.dependency '!ProtoCompiler'
  s.platform = :ios, '8.0'
  s.framework = 'CoreBluetooth'

  podspec_dir = File.dirname(__FILE__)
  protoc_dir = File.join(ENV['PWD'], 'ios/Pods/!ProtoCompiler')
  protoc = File.join(protoc_dir, 'protoc')
  objc_out = 'gen'
  proto_in = '../protos'
  s.prepare_command = <<-CMD
    cd #{podspec_dir}
    mkdir -p #{objc_out}
    #{protoc} \
      -I=#{proto_in} -I=#{protoc_dir} \
      --objc_out=#{objc_out} \
      #{proto_in}/*.proto
  CMD

  s.subspec 'Protos' do |ss|
    ss.source_files = 'gen/**/*'
    ss.public_header_files = 'gen/**/*.h'
    ss.requires_arc = false
    ss.dependency 'Protobuf'
  end

  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  # GCC_PREPROCESSOR_DEFINITIONS is needed by all pods that depend on Protobuf
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64',
    'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS=1',
  }

end
