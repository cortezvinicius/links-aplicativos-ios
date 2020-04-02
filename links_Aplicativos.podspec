
Pod::Spec.new do |s|
  s.name             = 'links_Aplicativos'
  s.version          = '1.0.0'
  s.summary          = 'Biblioteca que facilita utilizar recursos disponíveis no iOS.'
  s.homepage         = 'https://github.com/cortezvinicius/links-aplicativos-ios'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Vinicius Cortez' => 'cortezvinicius881@gmail.com' }
  s.source           = { :git => 'https://github.com/cortezvinicius/links-aplicativos-ios.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'links_Aplicativos/Classes/**/*'
end
