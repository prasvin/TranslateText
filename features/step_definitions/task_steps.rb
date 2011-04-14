Given /^a task with title "([^"]*)" and text "([^"]*)" exists$/ do |title, text|
  l1 = Language.create(:name => "English")
  l2 = Language.create(:name => "Nepali")
  txt = "aaaaaaa\r\n\r\nbbbbbb\r\ncccccccc\r\n\r\nddddddd"
  Requester.first.tasks.create(:title => title, :text => txt, :language_to => l1.id, :language_from => l2.id, :points => 100, :deadline => DateTime.now )
end
