Feature: Allow  user to login

Background: The user has already been signed in
  
  Given I am on login page 
  Given a valid user
  
Scenario: Successful Login 
  
  When I have entered email with "rama@abc.com" and password with "123456"
  And I click on the login button
  Then I should see "Login successful! Welcome"
  
  
Scenario: No/Bad Password
  
  When I have entered email with "rama@abc.com" and password with ""
  And I click on the login button
  Then I should see "Invalid email/password combination.Try again"
  
 
 Scenario: Successful Logout
   When I have entered email with "rama@abc.com" and password with "123456"
  And I click on the login button
   Given I am on home page
   
   And I click on the Logout button
  Then I should see "You have logged out"
    