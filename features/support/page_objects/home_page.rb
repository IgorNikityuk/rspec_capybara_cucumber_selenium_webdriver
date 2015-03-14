# -*- encoding : utf-8 -*-

class HomePage
  include Capybara::DSL
  include RSpec::Matchers

	def open
		visit('http://www.google.com.ua')
	end

	def basic_auth(name, password)
    if page.driver.respond_to?(:basic_auth)
      page.driver.basic_auth(name, password)
    elsif page.driver.respond_to?(:basic_authorize)
      page.driver.basic_authorize(name, password)
    elsif page.driver.respond_to?(:browser) && page.driver.browser.respond_to?(:basic_authorize)
      page.driver.browser.basic_authorize(name, password)
    else
      raise "I don't know how to log in!"
    end
  end

	def proceed_to_sign_in_page
		click_link "Sign In"
	end

	def user_should_be_logged_in_as user = "Admin"
		case user
		when "" then user_name = ""
		when ""	then user_name = ""
			expect(find(".last", :visible => true).text).to eq "Hello " + user_name
		end
	end


end