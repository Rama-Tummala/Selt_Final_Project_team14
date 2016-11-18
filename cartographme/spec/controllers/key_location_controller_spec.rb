require 'rails_helper'

RSpec.describe KeyLocationController, type: :controller do

  let!(:user) { User.new(:name => "User", :email => "user@useremail.com", :password => "password", :password_confirmation => "password") }
  let!(:keyLocation) {KeyLocation.new(:name => "Kinnick Stadium")}

  before do
    expect(User).to receive(:find_by).and_return(user)
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, {"name" => "IMU" , "lat" => 200, "lng" => 100, "description" => "Iowa Memorial Union, Iowa City, IA"}
      expect(response).to have_http_status(:success)
    end
    
    it "creates new marker" do
      allow_any_instance_of(KeyLocation).to receive(:getInfoString).and_return("test string")
      post :new, {"name" => "IMU" , "lat" => 200, "lng" => 100}
      expect(assigns(:new_marker)).to include(:infowindow => "test string", :lat => "200", :lng => "100")
    end
  end
  
  describe "POST #assign" do
    it "assigns location to user" do
      expect(KeyLocation).to receive(:find_by).and_return(keyLocation)
      post :assign, {"location" => "Kinnick Stadium"}
    end
  end
  
  describe "DELETE #destroy" do
    it "destroys the key location" do
      post :destroy
    end
  end
end