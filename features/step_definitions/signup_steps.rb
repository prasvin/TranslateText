Given /^the following signups:$/ do |signups|
  Signup.create!(signups.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) signup$/ do |pos|
  visit signups_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following signups:$/ do |expected_signups_table|
  expected_signups_table.diff!(tableish('table tr', 'td,th'))
end

Then /^(\d+) requester should exist$/ do |arg1|
  Requester.all.length.should == arg1.to_i
end

Then /^(\d+) translator should exist$/ do |arg1|
 Translator.all.length.should == arg1.to_i
end

Given /^I am not Authenticated$/ do
  visit('/users/sign_out')
end

Given /^a user exists with email "([^"]*)" and password "([^"]*)"$/ do |email, password|
  Requester.create( :name =>"Dipil", :email => email, :password => password, :password_confirmation => password, :type=>"Requester" )
end



