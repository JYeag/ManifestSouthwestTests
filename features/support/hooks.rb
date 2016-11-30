require 'watir-webdriver'
require 'page-object'
include PageObject::PageFactory

Before do
  @browser = Watir::Browser.new :chrome
end
After do
  @browser.close
end
