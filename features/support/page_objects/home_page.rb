# -*- encoding : utf-8 -*-

class HomePage
  include Capybara::DSL
  include RSpec::Matchers

	def open
		visit('')
	end

	def proceed_to_sign_in_page
		click_link "Sign In"
	end

	def user_should_be_logged_in_as user = "Admin"
		case user
		when "Business" then user_name = "flagco"
		when "Regular"	then user_name = "igor"
			expect(find(".last", :visible => true).text).to eq "Hello " + user_name
		end
	end


end