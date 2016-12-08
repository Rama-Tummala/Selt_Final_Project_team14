Feature: gmap interface
  
Background:setup key locations
  Given a valid user
  When I have entered email with "rama@abc.com" and password with "123456"
	And I click on the login button
	Then I should see "Login successful! Welcome"
	Given I am on the cartographme homepage
  Given the following key locations have been added to the city
  
Scenario:see map from homepage
  Then I should see a map displayed
  Then I should see a "Englert Civic Theatre" marker
  Then I should see a "North Market Park" marker

  