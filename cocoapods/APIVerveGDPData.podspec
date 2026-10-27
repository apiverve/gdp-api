Pod::Spec.new do |s|
  s.name             = 'APIVerveGDPData'
  s.version          = '1.2.3'
  s.summary          = 'Get GDP (Gross Domestic Product) data for any country including current values and historical data going back to 1960.'
  s.description      = <<-'DESC'
Get GDP (Gross Domestic Product) data for any country including current values and historical data going back to 1960.

This iOS/macOS SDK provides a convenient way to access the GDP Data from APIVerve.
Supports both callback-based and async/await patterns.
                       DESC

  s.homepage         = 'https://apiverve.com/marketplace/gdp?utm_source=cocoapods&utm_medium=referral&utm_content=homepage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'APIVerve' => 'hello@apiverve.com' }
  # The SDK repo holds every language; the pod lives under cocoapods/ with its own tag.
  s.source           = { :git => 'https://github.com/apiverve/gdp-api.git', :tag => "cocoapods/v#{s.version}" }

  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'

  s.swift_version = '5.0'

  s.source_files = 'cocoapods/Sources/APIVerveGDPData/**/*.swift'

  s.frameworks = 'Foundation'

  # APIResponse, APIVerveError and the request plumbing, shared by every APIVerve pod.
  s.dependency 'APIVerveCore', '~> 1.2'
end
