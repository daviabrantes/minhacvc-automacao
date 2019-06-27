Before do
    $driver.start_driver
end

Before do |scenario|
    $scenario = scenario.name.tr(' ', '_').downcase!
    $feature = scenario.feature.name.tr(' ', '_').downcase!
    $screenshotDir = ("screenshots/#{$env}/#{$feature}/#{$scenario}/")
end

After do
    $driver.driver_quit
    $logger.info("Fim do Teste!")
end

After do |scenario|
    if scenario.failed?
        $driver.screenshot($screenshotDir + "FAILED_#{$executionTime}.png")
    else
        $driver.screenshot($screenshotDir + "SUCCESS_#{$executionTime}.png")
    end
end

