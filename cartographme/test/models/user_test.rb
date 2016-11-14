require 'test_helper'

describe "User", ActiveSupport::TestCase do
    
  it "should follow and unfollow a user" do
    michael = users(:michael)
    archer  = users(:archer)
    assert_not michael.following?(archer)
    michael.follow(archer)
    michael.following?(archer).should.not == nil
    archer.followers.include?(michael).should.not == nil
    michael.unfollow(archer)
    assert_not michael.following?(archer)
  end
end