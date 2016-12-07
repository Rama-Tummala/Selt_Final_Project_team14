require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  let!(:user) { User.new(:name => "User", :email => "user@useremail.com", :password => "password", :password_confirmation => "password") }
  let!(:keyLocation) {KeyLocation.new(:name => "Kinnick Stadium", :lat => 45, :lng => -90, :email => "user@useremail.com")}
  
  before do
    expect(User).to receive(:find_by).and_return(user)
  end

  describe "index places gmap marker" do
    it "returns http success" do
      post :index
      expect(response).to have_http_status(:success)
    end
    
    #it "assigns markers to gon" do
    #  fake_loc = double("loc")
    #  expect(KeyLocation).to receive(:all).and_return([OpenStruct.new(:name =>"abc",:lat => 1,:lng => 2),OpenStruct.new(:name=>"ab", :lat =>3,:lng =>4)])
    #  allow_any_instance_of(KeyLocation).to receive(:getInfoString).and_return("")
    #  get :index
    #  expect(assigns(:all_markers)[0]).to include(:lat => 1, :lng => 2)
    #  expect(assigns(:all_markers)[1]).to include(:lat => 3, :lng => 4)
    #end
    
    it "assigns nothing if given keylocations returns nothing" do
      get :index
      expect(assigns(:all_markers)).to eql([])
    end
    
    it "has non empty locations" do
      post :index
      expect(KeyLocation).to receive(:all).and_return([keyLocation])
      expect(assigns(:all_locations)).not_to be_empty
    end
    
  end
  
end
 

