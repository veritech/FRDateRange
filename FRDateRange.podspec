Pod::Spec.new do |s|
  s.name         = "FRDateRange"
  s.version      = "0.2.0"
  s.homepage	 = "https://github.com/veritech/FRDateRange"
  s.summary      = "Date Range manipulation"
  s.description  = <<-DESC
  Simple wrapper around NSDate(s) for defining Date ranges.
                   DESC
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Jonathan Dalrymple" => "jonathan@float-right.co.uk" }
  s.source       = { :git => "https://github.com/veritech/FRDateRange.git", :tag => "0.2.0" }
  s.source_files  = "Classes", "**/*.{h,m}"
  s.requires_arc = true
  
  s.ios.deployment_target = "6.0"  
  s.dependency "NSDate-Escort", "~> 1.7.0"
  s.dependency "FRDateFormatterCache", "~> 0.2.0"
end
