require 'report_builder'

time = Time.now.getutc
ReportBuilder.configure do |config|
 config.json_path = 'reports.html'
 config.report_path = "reports/cucumber_web_report_#{time}"
 config.report_types = [:html]
 config.report_tabs = [:Overview, :Features, :Scenarios, :Errors]
 config.report_title = 'Cucumber web automation test results'
 config.compress_images = false
 config.additional_info = { 'Project name' => 'MinhaCVC', 'Platform' => "#{$env}", 'Report generated' => time }
end
ReportBuilder.build_report