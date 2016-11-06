Feature: gmap interface

Scenario:see map from homepage
  Given the following cities have been add to db:
  |city       |key_locations    |
  | Iowa City |Old Capital Mall |
  And the following key locations have been added to the city:
  | location_name           |lat        |lng        |
  | Englert Civic Theatre   |41.659763  |-91.532282 |
  And I am on the cartographme homepage
  Then I should see a map displayed
  And I should see a "Englert Civic Theatre" marker
  
  
Scenario:confirm visit to key location
  Given I am on the cartographme homepage
  When I select a key location from the map
  And I confirm I have visited the location
  Then I should see the marker chage to visited
  
Scenario:request new key location
  Given I am on the cartographme homepage
  When I right click a point on the map
  And I click recomend key location  
  Then I should see a confirmation the location has been recomended
  
  