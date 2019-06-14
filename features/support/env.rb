require 'pry'
require 'appium_lib'
require 'cucumber'
require 'selenium-webdriver'
require 'allure-cucumber'
require 'rubygems'
require 'rspec'
require "rspec/expectations"
require 'report_builder'
require_relative '../pageobjects/login_page.rb'

class AppiumWorld
end

time  = Time.new
time = time.strftime('%d-%m-%Y')
$logger = Logger.new("./exec-logs/exec-log-#{time}.log")

if ENV['PLATFORM'].nil?
    raise 'Voce tem que definir se é iOS ou Android'
else
    $env = ENV['PLATFORM'].downcase
end

case $env
    when 'android'
        def caps
            { caps: {
                deviceName: "MinhaCVC",
                platformName: "Android",
                app: (File.join(File.dirname(__FILE__), "app-prd.apk")),
                appPackage: "com.cvc.minhacvc",
                appActivity: "com.cvc.minhacvc.launch.LaunchActivity",
                language: "pt",
                locale: "BR",
                newCommandTimeout: "3600"
            }}
          end
    
    when 'ios'
        def caps
            { caps: {
                app: (File.join(File.dirname(__FILE__), "CVC.app")),
                deviceName: "iPhone 8",
                platformName: "iOS",
                platformVersion: "12.1",
                bundleId: "com.cvc.minhacvc.enterprise",
                automationName: "XCUITest",
                newCommandTimeout: "3600",
                sendKeyStrategy: "grouped"
            }}
        end
    
    else 
        raise("Acho que #{ENV} não é uma plataforma mobile")
end
  
Appium::Driver.new(caps, true)
Appium.promote_appium_methods Object

World do
    AppiumWorld.new
end
  
Massa = YAML.load_file("features/support/massa.yaml")