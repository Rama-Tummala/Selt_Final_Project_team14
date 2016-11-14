Feature: gmap interface
  
Background:setup key locations
  Given the following key locations have been added to the city:
  | name                    |lat        |lng        |
  | Englert Civic Theatre   |41.659763  |-91.532282 |
  | Popeyes                 |41.759763  |-91.532282 |
  | Starbucks               |41.559763  |-91.532282 |
  And I am on the cartographme homepage
  
Scenario:see map from homepage
  Then I should see a map displayed
  And I should see a "Englert Civic Theatre" marker
  And I should see a "Popeyes" marker
  And I should see a "Starbucks" marker
  
Scenario:confirm visit to key location
  When I select a key location from the map
  And I confirm I have visited the location
  Then I should see the marker change to visited
  
Scenario:request new key location
  When I right click a point on the map
  And I click recomend key location  
  Then I should see a confirmation the location has been recomended
  
  