require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'capybara/rspec'
require 'rspec/autorun'
require 'selenium-webdriver'
require 'pry'

#settings for Firefox
Capybara.register_driver :selenium_firefox do |app|  
  Capybara::Selenium::Driver.new(app, :browser => :firefox)
end

Capybara.configure do |config|
  config.default_driver = :selenium_firefox
  config.javascript_driver = :poltergeist
  config.run_server = false
  config.default_selector = :css
  config.app_host = 'http://staging.limos.com'
end

#settings for chrome
# Capybara.register_driver :selenium_chrome do |app|  
#   Capybara::Selenium::Driver.new(app, :browser => :chrome)
# end

# Capybara.configure do |config|
#   config.default_driver = :selenium_chrome
#	config.javascript_driver = :poltergeist
#   config.run_server = false
#   config.app_host = "http://www.vk.com"
#   config.default_selector = :css
# end

Capybara.default_wait_time = 5