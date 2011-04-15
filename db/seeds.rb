# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

require 'ffaker'

[
  { :name => "English" },
  { :name => "Nepali" },
  { :name => "Hindi" },
  { :name => "Japanese" },
  { :name => "Urdu" }
].each do |attribute|
    Language.find_or_create_by_name(attribute)
end

[
  { :name =>"chandra", :email => "c@a.com", :points =>100, :password =>"123456", :type => "Translator"},
  { :name =>"Dipil", :email => "a@a.com", :points =>1000, :password =>"123456", :type => "Requester"}
].each do |attribute|
    User.find_or_create_by_name(attribute)
end

(1..5).each do |x|
  Requester.first.tasks.create(:title => Faker::Company.bs,
                               :language_to => x,
                               :language_from => 6-x,
                               :text => Faker::Lorem.paragraphs(x*2).join("\r\n\r\n"),
                               :points => x*10)
end
