require 'cucumber'
require 'watir-webdriver'


Before do
  @browser = Watir::Browser.new :chrome
  @browser.goto(BASE_URL)
end

After do |scenario|
  @browser.cookies.clear
  @browser.close
end



# Allows browser object to be shared across page object classes without declaring it in every po
module PageInitializer
  # initializer for page objects, generic @browser initializer/parser
  def initialize(browser)
    @browser = browser
  end
end


