require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'test/unit/assertions'
require 'rspec'

require './features/page_object/search_result_page'
require './features/page_object/home_page'

include Capybara::DSL
include Test::Unit::Assertions

#Capybara.current_driver = :selenium
Capybara.default_driver = :selenium
#Capybara.default_selector = :xpath
Capybara.default_wait_time = 30 # seconds
Capybara.run_server = false

#Capybara.register_driver :selenium do |app|
#  Capybara::Selenium::Driver.new(app, :browser => :firefox, desired_capabilities: {"args" => [ "--test-type" ]})
#end


Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.javascript_driver = :chrome


#Reporting stuff
Capybara.save_and_open_page_path = "../../results/"

#Maximize the window
page.driver.browser.manage.window.maximize

