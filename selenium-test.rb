require "selenium-webdriver" # load in the webdriver gem to interact with Selenium
require "pry"
# create a driver object.
# This is what you will actually interact with to do things within the automated
driver = Selenium::WebDriver.for :firefox

# open CrossBrowserTesting.com inside Chrome
driver.navigate.to "https://www.instagram.com/accounts/login/?source=auth_switcher"
sleep(2)
username = driver.find_element(name: "username")
username.send_keys("")
password= driver.find_element(name: "password")
password.send_keys("")
login_btn = driver.find_elements(tag_name: "button").select{|el| el.text == 'Log In'}
login_btn.first.click()
sleep(4)
driver.find_elements(tag_name: "button").select{|el| el.text == "Not Now"}.first.click()
btns = []
10000.times do
	driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
	sleep(0.5)
	driver.find_elements(class: "glyphsSpriteHeart__outline__24__grey_9").each do |e|
		begin
			e.click()
		rescue
			puts e
		end
	end
	sleep(0.5)
end

# like_btn = driver.find_elements(class: "glyphsSpriteHeart__outline__24__grey_9")
driver.quit
