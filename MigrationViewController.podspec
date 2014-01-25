Pod::Spec.new do |s|
  s.name     = 'MigrationViewController'
  s.version  = '0.0.4'
  s.license  = 'MIT'
  s.summary  = 'This is CoreData migration when updating to display library'
  s.homepage = 'https://github.com/akuraru/MigrationViewController'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author   = { 'Akuraru IP' => 'akuraru@gmail.com' }
  s.source   = {
    :git => 'https://github.com/akuraru/MigrationViewController.git'
    :tag => s.version.to_s
  }
  s.platform = :ios
  s.requires_arc = true

  s.subspec 'Core' do |a|
    a.source_files  = 'lib/MigrationBaseViewController.{h,m}'
  end
  s.subspec 'Core' do |a|
    a.source_files  = 'lib/MigrationViewController.{h,m}'
    s.dependency 'MagicalRecord'
  end
end