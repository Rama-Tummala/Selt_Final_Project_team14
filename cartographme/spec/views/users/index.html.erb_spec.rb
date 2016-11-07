require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "User_One",
        :email => "userone@uiowa.edu",
        :password => "Password",
        :password_confirmation => "Password"
      ),
      User.create!(
        :name => "User_Two",
        :email => "usertwo@uiowa.edu",
        :password => "Password",
        :password_confirmation => "Password"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
  end
end
