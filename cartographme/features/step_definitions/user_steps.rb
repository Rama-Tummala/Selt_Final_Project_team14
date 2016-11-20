

Given /^I am on login page$/ do
 visit login_path 
end

 Given /^I am on Signup page$/ do
    visit signup_path
end

Given /^I am on home page$/ do
    visit home_index_path
end

Given /^that I have gone to the user search page$/ do
  visit users_path
end

When /^I have entered email with "([^"]*)" and password with "([^"]*)"$/ do |email,pwd|
     visit login_path
     fill_in 'session_password', :with=> pwd
     fill_in 'session_email', :with=> email
    
      end
      

 When /^I have entered email with "([^"]*)" and password with "([^"]*)" and name with "([^"]*)" and password_confirmation with "([^"]*)"$/ do |email,pwd,name,pwd_confirm|
     visit signup_path
     fill_in 'user_password', :with=> pwd
     fill_in 'user_email', :with=> email
     fill_in 'user_name', :with=> email
     fill_in 'user_password_confirmation', :with=> pwd_confirm
    
      end
  
When /^I click on the login button$/ do
  click_button 'Log in'
end
When /^I click on the Logout button$/ do
  click_button 'logout'
end

  
 Given /^a valid user$/ do
  @user = User.create!({
             :name => "rama",
             :email => "rama@abc.com",
             :password => "123456",
             :password_confirmation => "123456"
           })
end
 Then /^I should see "([^"]*)"$/ do |text|
    expect(page).to have_content(text)
 end
 
 When(/^I click on the Create my account button$/) do
  click_button 'Create my account'
end
  
Given /^a valid user is logged in$/ do
  @user = User.create!({
             :name => "rama",
             :email => "rama@abc.com",
             :password => "123456",
             :password_confirmation => "123456"
           })
    
    click_button 'Log in'
end
When /^I add "(.*)" to the search box$/ do |item|
  fill_in 'search', :with => item
end
And /^click the Search Button$/ do
  click_button 'Search'
end

Then /^(?:|I )should see "([^"]*)" in the results$/ do |text|
  expect(page).to have_content(text)
end

Then /^(?:|I )should not see "([^"]*)" in the results$/ do |text|
  expect(page).to have_no_content(text)
end