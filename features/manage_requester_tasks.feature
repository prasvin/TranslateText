Feature: Manage requester_tasks
  Background:
     Given I have a Requester with email "a@a.com" and password "123456"
     And I am Authenticated as a Requester with email "a@a.com" and password "123456"

  Scenario: Create a task
        Given a language "English" exists
        And a language "Nepali" exists
        And I am on the user_root page
        Then I should see "Remaining Points: 1000.0"
        When I follow "Request New Translation"
        And I fill in "Title" with "Nepali translation"
        And I select "English" from "From"
        And I select "Nepali" from "To"
        And I fill in "Points" with "120"
        And I fill in "Text" with "aaaaaaa\r\n\r\nbbbbbb\r\ncccccccc\r\n\r\nddddddd"
        And I press "Create Task"
        Then I should see "New Task 'Nepali translation' Created"
        And I should see "0.0 %"
        Then I should see "Remaining Points: 880.0"

    Scenario: View a Task
        Given a task with title "Nepali Translation" and text "aaaaaaa\r\n\r\nbbbbbb\r\ncccccccc\r\n\r\nddddddd" exists
        And I am on the user_root page
        When I follow "Nepali Translation"
        Then I should see "paragraphs"
        And I should see "Paragraph1"
        And I should see "Paragraph2"
        And I should see "Paragraph3"

    @javascript
    Scenario: Purchase points
        Given I should see "Remaining Points: 1000.0"
        And I follow "Purchase More"
        And I fill in "Points" with "100"
        And I press "Purchase"
        Then I should see "Remaining Points: 1100.0"

    Scenario: Check requester points during task creation
        Given a language "English" exists
        And a language "Nepali" exists
        And I am on the user_root page
        Then I should see "Remaining Points: 1000.0"
        When I follow "Request New Translation"
        And I fill in "Title" with "Nepali translation"
        And I select "English" from "From"
        And I select "Nepali" from "To"
        And I fill in "Points" with "1200"
        And I fill in "Text" with "aaaaaaa\r\n\r\nbbbbbb\r\ncccccccc\r\n\r\nddddddd"
        And I press "Create Task"
        Then I should see "Not Enough Points"
