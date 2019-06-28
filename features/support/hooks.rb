Before do
    $driver.start_driver
end

Before do |scenario|
    $scenario = scenario.name.tr(' ', '_').downcase!
    $logger.debug("Início do teste do cenário #{$scenario}...")
end

After do
    $driver.driver_quit
end

After do |scenario|
    file_name = scenario.name.gsub(' ', '_').downcase!
    if scenario.failed?
        target = "data/screenshots/#{$env}/FAILED_#{file_name}_#{$executionTime}.png"
    else
        target = "data/screenshots/#{$env}/SUCCESS_#{file_name}_#{$executionTime}.png"
    end
        @driver.screenshot(target)
        embed(target, 'image/png', 'Evidência')
    $logger.debug("Fim do teste do cenário #{scenario}...")
end

at_exit do
    $time = Time.now.getutc
    ReportBuilder.configure do |config|
    config.json_path = 'data/report/report.json'
    config.report_path = 'data/report/minhacvc_report'
    config.report_types = [:html]
    config.report_title = 'Minha CVC Regression Reports'
    config.include_images = true
    config.compress_images = false
    config.additional_info = { 'Project name' => 'Minha CVC', 'Platform' => "#{$env}", 'Report generated' => $executionTime }
    end
    ReportBuilder.build_report
    $logger.debug("Fim dos Testes!")
end