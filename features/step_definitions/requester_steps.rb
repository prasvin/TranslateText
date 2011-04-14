Given /^I have a Requester with email "([^"]*)" and password "([^"]*)"$/ do |email, password|
  Requester.create( :name =>"Dipil", :email => email, :password => password, :password_confirmation => password, :points => 1000 )
end

Given /^I am Authenticated as a Requester with email "([^"]*)" and password "([^"]*)"$/ do |email, password|
  visit destroy_user_session_path
  visit root_path
  fill_in( "user_email", :with => email )
  fill_in( "user_password", :with => password )
  click_button("Login")
end

Given /^a language "([^"]*)" exists$/ do |name|
  Language.create(:name => name)
end

