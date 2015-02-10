# -*- encoding : utf-8 -*-

class SignInPage
  include Capybara::DSL
  include RSpec::Matchers

	def open
		visit('/signin')
	end

	def fill_fields_for user
		case user
		when "Regular"  then user_credentials = { email: "", password: "" }
		when "Business" then user_credentials = { email: "",   password: "" }
		end
		
		fill_in "email", 		:with => user_credentials[:email]
		fill_in "password", :with => user_credentials[:password]
	end

	def accept_credentials
		click_button "Sign in"
	end

	def sign_in_as user = "Admin"
		fill_fields_for user
		accept_credentials
	end

	def should_be_opened
		expect(find("#email")).to be_visible
  	expect(find("#password")).to be_visible
	end

end