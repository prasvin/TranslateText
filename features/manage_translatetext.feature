Feature: Manage translatetext

 Background:
   Given I have a Requester with email "a@a.com" and password "123456"
   And a task with title "Nepali Translation" and text "aaaaaaa\r\n\r\nbbbbbb\r\ncccccccc\r\n\r\nddddddd" exists

 @javascript
 Scenario: Translate the microtask
        Given I am Authenticated as a Translator with email "c@a.com" and password "123456"
        And I am on the user_root page
        When I follow "choose"
        And I fill in "translated_paragraph" with " @@@@@$$$$@@909"
        And I press "Submit"
        Then I should see "The task has been translated"
        When I follow "Sign Out"
