Given /^I am Authenticated as a Translator with email "([^"]*)" and password "([^"]*)"$/ do |email, password|
  Translator.create( :name =>"Chandra", :email => email, :password => password, :password_confirmation => password )
  visit root_path
  fill_in( "user_email", :with => email )
  fill_in( "user_password", :with => password )
  click_button("Login")
end
