require 'report_builder'

$time = Time.now.getutc
ReportBuilder.configure do |config|
 config.report_path = 'reports.json'
 config.input_path = "reports.json"
 config.report_types = [:html]
 config.report_tabs = [:Overview, :Features, :Scenarios, :Screenshots]
 config.report_title = 'Minha CVC Regression Reports'
 config.compress_images = false
 config.additional_info = { 'Project name' => 'Minha CVC', 'Platform' => "#{$env}", 'Report generated' => $executionTime }
end
ReportBuilder.build_report