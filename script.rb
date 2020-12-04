require "selenium-webdriver"
require 'dotenv' 

driver = Selenium::WebDriver.for :firefox
driver.navigate.to "https://www.linkedin.com/school/makers-academy/people/"
wait = Selenium::WebDriver::Wait.new(timeout: 20) # seconds

# puts "Test Passed: Page 1 Validated" if wait.until {
#   driver.find_element(:class, 'main__sign-in-link').displayed?
# }
driver.find_element(:id, 'username').send_keys ENV['EMAIL']
driver.find_element(:id, 'username').send_keys ENV['PASSWORD']

driver.wait

driver.quit



# https://www.linkedin.com/school/makers-academy/people/