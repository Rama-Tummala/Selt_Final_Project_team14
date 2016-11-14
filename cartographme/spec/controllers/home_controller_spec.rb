require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "index places gmap marker" do
    it "returns http success" do
      post :user
      expect(response).to have_http_status(:success)
    end
    
    it "assigns markers to gon" do
      expect(Key_Location).to receive(:all).and_return([OpenStruct.new(:name =>"abc",:lat => 1,:lng => 2),OpenStruct.new(:name=>"ab", :lat =>3,:lng =>4)])
      get :index
      expect(assigns(:all_markers)[0]).to include("lat" => 1, "lng" => 2)
      expect(assigns(:all_markers)[1]).to include("lat" => 3, "lng" => 4)
    end
    
    it "assigns nothing if given keylocations returns nothing" do
      expect(Key_Location).to receive(:all).and_return([])
      get :index
      expect(assigns(:all_markers)).to eql([])
    end
  end
 
end
