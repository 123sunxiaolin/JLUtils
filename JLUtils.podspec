Pod::Spec.new do |s|
    s.name         = 'JLUtils'
    s.version      = '1.0.0'
    s.summary      = 'A Lib provide usual category methods!'
    s.homepage     = 'https://github.com/123sunxiaolin/JLUtils'
    s.license      = 'MIT'
    s.authors      = {'Jack_lin' => '401788217@qq.com'}
    s.platform     = :ios, '8.0'
    s.source       = {:git => 'https://github.com/123sunxiaolin/JLUtils.git', :tag => s.version}
    s.source_files = 'JLUtils/*.{h,m}'
    s.requires_arc = true
end