require "selenium-webdriver"
require 'dotenv/load'

driver = Selenium::WebDriver.for :firefox
driver.navigate.to "https://www.linkedin.com/school/makers-academy/people/"
wait = Selenium::WebDriver::Wait.new(timeout: 10) # seconds

# puts "Test Passed: Page 1 Validated" if wait.until {
#   driver.find_element(:class, 'main__sign-in-link').displayed?
# }
username_input = wait.until {
  element = driver.find_element(:id, 'username')
  element if element.displayed?
}
username_input.send_keys "#{ENV['EMAIL']}"

password_input = wait.until {
  element = driver.find_element(:id, 'password')
  element if element.displayed?
}
password_input.send_keys "#{ENV['PASSWORD']}"

driver.find_element(:class, 'btn__primary--large').click

puts "Beep beep boop. Logged into the mainframe!" if wait.until { /Makers/.match(driver.page_source) }
 
puts "Found yas!" if wait.until {
 
} 



# https://www.linkedin.com/school/makers-academy/people/