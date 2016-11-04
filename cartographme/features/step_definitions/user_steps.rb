
Given /^I am on login page$/ do
 visit login_path 
end

 Given /^I am on Signup page$/ do
    visit signup_path
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
  
 
 Then /^I should see "([^"]*)"$/ do |text|
    expect(page).to have_content(text)
 end
 
 When(/^I click on the Create my account button$/) do
  click_button 'Create my account'
end

 
  
  