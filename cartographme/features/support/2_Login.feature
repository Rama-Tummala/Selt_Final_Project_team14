Feature: Allow  user to login

Background : Correct page
  Given I am on login page
  
Scenario: Successful Login 
  
  When I have entered email with "rama@abc.com" and password with "123456"
  And I click on the login button
  Then I should see "Login successful! Welcome"
  
  
Scenario: No/Bad Password
  
  When I have entered email with "rama@abc.com" and password with ""
  And I click on the login button
  Then I should see "Invalid email/password combination.Try again"
  
  