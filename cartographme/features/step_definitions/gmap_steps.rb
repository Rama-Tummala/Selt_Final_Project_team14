  Given /^I am on the cartographme homepage$/ do 
    visit home_index_path
  end
  
 Given /^the following cities have been add to db:$/ do |cities_table|
   pending
   cities_table.hashes.each do |city|
     #TODO: Add cites to db
   end
 end
 
  Given /^the following key locations have been added to the city$/ do
     key_locations = KeyLocation.create([
      {
        lat: '41.659763', 
        lng: '-91.532282',
        name: 'Englert Civic Theatre',
        email: 'admin',
        description: "Englert Theatre in Iowa City, Iowa."
      },
      {
        lat: '41.666768',
        lng: '-91.527106',
        name: "North Market Park",
        email: 'admin',
        description: "North Market Park in IC, IA"
      }
    ])
  end
  
  Then /^I should see a map displayed$/ do 
    page.has_css?('div#map')
    within('div#map') do
      page.has_css?('div.gm-style')
    end
  end
  
  Then /^I should see a "(.*?)" marker$/ do|location_name|
    page.has_content?(location_name)
  end

=begin
    When /^I select a key location from the map$/ do 
      pending
      Capybara.register_driver :selenium do |app|
        Capybara::Selenium::Driver.new(
          app,
          browser: :firefox,
          desired_capabilities: Selenium::WebDriver::Remote::Capabilities.firefox(marionette: false)
        )
      end
      page.execute_script("google.maps.event.trigger(marker, 'click', { latLng: new google.maps.LatLng(41.659763, -91.532282)});")
    end


  Given /^I confirm I have visited the location$/ do 
    find_button(id: 'visited_button').click
  end
  


  When /^I right click a point on the map$/ do 
     key_locations = KeyLocation.create([
      {
        lat: '41.663622',
        lng: '-91.530299',
        name: "The Bluebird Diner",
        email: 'rama@gmail.com',
        description: "The Bluebird Diner in IC, IA"
      }
    ])
    
  end
  
  When /^I click recomend key location$/ do
     find_button(id: 'recomend_button').click
  end
  
  Then /^I should see a confirmation the location has been recomended$/ do 
    pending
    #TODO check page content for location add
  end
  
=end