require 'capybara'
require 'capybara/cucumber'
require 'faker'
require 'selenium-webdriver'
require 'site_prism'
require 'ostruct'
require_relative 'page_helper.rb'
require_relative 'helper.rb'

BROWSER = ENV['BROWSER']

World(Pages)
World(Helper)

Capybara.register_driver :selenium do |app|

if BROWSER.eql?('chrome')
  Capybara::Selenium::Driver.new(app, :browser => :chrome)

elsif BROWSER.eql?('chrome_headless')
    Capybara::Selenium::Driver.new(app, :browser => :chrome,
    desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
     'chromeOptions' => {'args' =>['--headless', 'disable-gpu']}
    )
    )

elsif BROWSER.eql?('firefox')
  Capybara::Selenium::Driver.new(app, :browser => :firefox, :marionette =>true)

elsif BROWSER.eql?('firefox_headless')
    browser_options = Selenium::WebDriver::Firefox::Options.new(args: ['--headless'])
    Capybara::Selenium::Driver.new(
      app, :browser => :firefox,
      options: browser_options)

#elsif BROWSER.eql?('ie')  
 # Capybara::Selenium::Driver.new(app, :browser => :internet_explorer)
end

end

Capybara.configure do |config|
  config.default_driver = :selenium 
  config.app_host = 'https://automacaocombatista.herokuapp.com'
  config.default_max_wait_time = 5
end