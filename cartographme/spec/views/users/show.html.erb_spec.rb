require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :name => "User_One",
      :email => "userone@uiowa.edu",
      :password => "Password",
      :password_confirmation => "Password"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Password/)
  end
end
