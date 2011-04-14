Feature: Manage signups

  @javascript
  Scenario: Sign Up for requester
        Given I am not Authenticated
        Given I am on the root page
        When I follow "Need Translation"
        And I follow "Sign Up"
        And I fill in "Name" with "Dipil"
        And I fill in "sign_up_email" with "dipil@d.com"
        And I fill in "sign_up_password" with "123456"
        And I fill in "Password confirmation" with "123456"
        And I press "Sign up"
        Then 1 requester should exist

  @javascript
  Scenario: Sign In
    Given I am not Authenticated
    And I am on the root page
    And a user exists with email "a@k.com" and password "123456"
    When I fill in "user_email" with "a@k.com"
    And I fill in "user_password" with "123456"
    And I press "Login"
    Then should see "Signed in successfully"