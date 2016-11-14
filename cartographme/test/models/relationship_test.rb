require 'test_helper'

describe "Relationship", ActiveSupport::TestCase do

  before do
    @relationship = Relationship.new(follower_id: users(:jake).user_id,
                                     followed_id: users(:nhan).user_id)
  end

  it "should be valid" do
    @relationship.valid?.should.not == nil
  end

  it "should require a follower_id" do
    @relationship.follower_id = nil
    assert_not @relationship.valid?
  end

  it "should require a followed_id" do
    @relationship.followed_id = nil
    assert_not @relationship.valid?
  end
end