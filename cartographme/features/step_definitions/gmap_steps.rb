  Given /^I am on the cartographme homepage$/ do 
    visit home_index_path
  end
  
 Given /^the following cities have been add to db:$/ do |cities_table|
   pending
   cities_table.hashes.each do |city|
     #TODO: Add cites to db
   end
 end
 
  Given /^the following key locations have been added to the city:$/ do |key_locations_table|
    pending
     key_locations_table.hashes.each do |location|
     #TODO: Add location to db
   end
  end
  
  
  Then /^I should see a map displayed$/ do 
   pending
    #TODO:check page for map id 
   
  end
  
  Then /^I should see a "(.*?)" marker$/ do|location_name|
    pending
    #TODO:check page for name of city
  end
  

 
  When /^I select a key location from the map$/ do 
     pending
     #TODO: trigger js marker event
    
  end
  
  Given /^I confirm I have visited the location$/ do 
     pending
    #TODO: click button after marker event
  end
  
  Then /^I should see the marker chage to visited$/ do 
     pending
    #TODO: check image uri for visisted marker
  end
  

  When /^I right click a point on the map$/ do 
    pending
    #TODO: trigger gmap right click event
  end
  
  When /^I click recomend key location$/ do
     pending
    #TODO: click recomend button
  end
  
  Then /^I should see a confirmation the location has been recomended$/ do 
    pending
    #TODO check page content for location add
  end
  