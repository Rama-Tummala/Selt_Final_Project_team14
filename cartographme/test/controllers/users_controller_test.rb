require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest


  before do
    @user = users(:michael)
    @other_user = users(:archer)
  end
 
  it "should redirect following when not logged in" do
    get following_user_path(@user)
    assert_redirected_to login_url
  end

  it "should redirect followers when not logged in" do
    get followers_user_path(@user)
    assert_redirected_to login_url
  end
end