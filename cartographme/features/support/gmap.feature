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
  And I should see a "Englert Civic Theatre" marker
  And I should see a "North Market Park" marker
  
Scenario:confirm visit to key location
  When I select a key location from the map
  And I confirm I have visited the location
  Then I should see "marked as visited."
  
Scenario:request new key location
  When I right click a point on the map
  And I click recomend key location  
  Then I should see a confirmation the location has been recomended
  
  