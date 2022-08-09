Pod::Spec.new do |spec|
    spec.name                     = 'greet'
    spec.version                  = '1.0'
    spec.homepage                 = 'Link to the Shared Module homepage'
    spec.source                   = { :http=> ''}
    spec.authors                  = ''
    spec.license                  = ''
    spec.summary                  = 'Some description for the Shared Module'
    spec.vendored_frameworks      = 'greet/build/cocoapods/publish/release/greet.xcframework'
    spec.libraries                = 'c++'
    spec.ios.deployment_target = '14.1'
                
                
    spec.pod_target_xcconfig = {
        'KOTLIN_PROJECT_PATH' => ':greet',
        'PRODUCT_MODULE_NAME' => 'greet',
    }

    spec.prepare_command = <<-SCRIPT
          set -ev
          ./gradlew --no-daemon -Pframework=#{spec.name}.framework podPublishXCFramework --stacktrace --info
        SCRIPT
end