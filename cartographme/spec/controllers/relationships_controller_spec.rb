require 'rails_helper'
require 'spec_helper'

RSpec.describe RelationshipsController, type: :controller do
    
    let!(:user) { User.new(:name => "User", :email => "user@useremail.com", :password => "password", :password_confirmation => "password") }
    
    it "create should require logged-in user" do
        expect(User).to receive(:find).and_return(user)
        assert_no_difference 'Relationship.count' do
            post :create
        end
        assert_redirected_to login_url
    end

    it "destroy should require logged-in user" do
        assert_no_difference 'Relationship.count' do
            delete relationship_path(relationships(:one))
        end
        assert_redirected_to login_url
    end
end
