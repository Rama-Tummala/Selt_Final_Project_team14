# Completed step definitions for basic features: AddMovie, ViewDetails, EditMovie 

Given /^that I have gone to the user search page$/ do
  visit users_path
end

When /^I add "(.*)" to the search box$/ do |item|
  fill_in 'search', :with => item
end

And /^click the Search Button$/ do
  click_button 'Search'
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
  expect(page).to have_content(text)
end