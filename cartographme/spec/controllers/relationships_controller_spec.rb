require 'rails_helper'
require 'spec_helper'

RSpec.describe RelationshipsController, type: :controller do
    
    let!(:john) { User.new(:id => 20, :name => "John", :email => "john@useremail.com", :password => "password", :password_confirmation => "password") }
    let!(:jane) { User.new(:id => 10, :name => "Jane", :email => "jane@useremail.com", :password => "password", :password_confirmation => "password") }
    
    it "create should require logged-in user" do
        expect(User).to receive(:find).and_return(john)
        assert_no_difference 'Relationship.count' do
            post :create, {:follower_id => 20, :followed_id => 10}
        end
        assert_redirected_to login_url
    end

    it "destroy should require logged-in user" do
        expect(User).to receive(:find).and_return(john)
        assert_no_difference 'Relationship.count' do
            delete :destroy, {:user_id => 20}
            delete relationship_path(relationships(:one))
        end
        assert_redirected_to login_url
    end
end
