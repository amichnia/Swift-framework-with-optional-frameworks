# This is an example of pods setup for closed source frameworks
# deployment, where one of the frameworks is optional.
# Including optional framework should alter MainSDK behaviour, without
# exposing any additional knowledge to sdk users

Pod::Spec.new do |s|
    s.name             = 'MultiSDK'
    s.version          = '0.1.0'
    s.summary          = 'A short description of MultiSDK.'
    s.description      = <<-DESC
    TODO: Add long description of the pod here.
                       DESC

    s.homepage         = 'https://github.com/amichnia/MultiSDK'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Andrzej Michnia' => 'amichnia@gmail.com' }
    s.source           = { :git => 'https://github.com/amichnia/MultiSDK.git', :tag => s.version.to_s }
    s.user_target_xcconfig = {
        'OTHER_LDFLAGS' => '-ObjC -lc++ -lz',
        'CLANG_MODULES_AUTOLINK' => 'YES'
    }

    s.ios.deployment_target = '12.1'
    s.default_subspec  = "MainSDK"

    s.subspec 'MainSDK' do |subspec|
        subspec.vendored_frameworks = ['SDKProducts/MainSDK.framework']
    end

    s.subspec 'AdditionalSDK' do |subspec|
        subspec.vendored_frameworks = ['SDKProducts/AdditionalSDK.framework']
    end
end
