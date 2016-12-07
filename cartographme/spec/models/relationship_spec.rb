require 'rails_helper'

RSpec.describe Relationship, type: :model do
  
  before do
    @relationship = Relationship.new(follower_id: 0,
                                     followed_id: 1)
  end

  it "should be valid" do
    expect(@relationship).to be_valid
  end

  it "should require a follower_id" do
    @relationship.follower_id = nil
    expect(@relationship).to be_invalid
  end

  it "should require a followed_id" do
    @relationship.followed_id = nil
    expect(@relationship).to be_invalid
  end
end
