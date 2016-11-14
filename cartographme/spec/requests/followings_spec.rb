require 'rails_helper'

RSpec.describe "Followings", type: :request do
  describe "GET /followings" do
    it "works! (now write some real specs)" do
      get followings_path
      expect(response).to have_http_status(200)
    end
  end
  
  before do
    @user = users(:michael)
    log_in_as(@user)
  end

  it "following page" do
    get following_user_path(@user)
    assert_not @user.following.empty?
    assert_match @user.following.count.to_s, response.body
    @user.following.each do |user|
      assert_select "a[href=?]", user_path(user)
    end
  end

  it "followers page" do
    get followers_user_path(@user)
    assert_not @user.followers.empty?
    assert_match @user.followers.count.to_s, response.body
    @user.followers.each do |user|
      assert_select "a[href=?]", user_path(user)
    end
  end
end
