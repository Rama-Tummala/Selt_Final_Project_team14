Feature: Allow  user to Signup

Background : Correct page
  Given I am on Signup page

Scenario: Successful Signup
  
  When I have entered email with "rama@abc.com" and password with "123456" and name with "rama" and password_confirmation with "123456"
  And I click on the Create my account button
  Then I should see "Sign up successful! Welcome"
  
  
Scenario: Signup Failures
  
  When I have entered email with "rama@abc.com" and password with "123456" and name with "rama" and password_confirmation with "123457"
  And I click on the Create my account button
  Then I should see "Password confirmation doesn't match Password"
  
Scenario: Signup Failures
  
  When I have entered email with "rama@abc.com" and password with "123456" and name with "rama" and password_confirmation with ""
  And I click on the Create my account button
  Then I should see "Password confirmation can't be blank"