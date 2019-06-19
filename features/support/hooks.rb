Before do
    $driver.start_driver
end

After do
    $driver.driver_quit
    $logger.info("Fim do Teste!")
end

Before do |scenario|
    $scenario = scenario.name.tr(' ', '_').downcase!
end