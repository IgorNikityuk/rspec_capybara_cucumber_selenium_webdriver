Given(/^I open home page$/) do
  @home_page = HomePage.new
  @home_page.open
end

When(/^I go to Sign in page$/) do
  click_link "Sign In"
end

Then(/^I should be on Sign in page$/) do
	@sign_in_page = SignInPage.new
	@sign_in_page.should_be_opened
end

Then(/^I should be on home page$/) do
  expect(find("#service_type")).to be_visible
end

Then(/^I should be logged in as "(.*?)" user$/) do |user|
  @home_page = HomePage.new
  @home_page.user_should_be_logged_in_as user
end


Given(/^I sign in as "(.*?)" user$/) do |user|
	@sign_in_page = SignInPage.new
	@sign_in_page.fill_fields_for user
	@sign_in_page.accept_credentials
end

