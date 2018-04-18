Pod::Spec.new do |s|
  s.name             = 'iBarChart'
  s.version          = '0.1'
  s.summary          = 'A simple animated vertical bar chart component.'
 
  s.description      = <<-DESC
  A simple, fully customizable and animated vertical bar chart component.
                       DESC
 
  s.homepage         = 'https://github.com/iMhdi/iBarChart'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'El Mahdi BOUKHRIS' => 'm.boukhris@gmail.com' }
  s.source           = { :git => 'https://github.com/iMhdi/iBarChart.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '8.0'
  s.source_files = 'iBarChart/**/*.{h,m}'
  s.resources = 'iBarChart/**/*.xib'
  s.frameworks = 'UIKit'
 
end