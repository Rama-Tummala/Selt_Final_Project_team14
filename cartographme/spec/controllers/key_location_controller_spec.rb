require 'rails_helper'

RSpec.describe KeyLocationController, type: :controller do

  let!(:user) { User.new(:name => "User", :email => "user@useremail.com", :password => "password", :password_confirmation => "password") }
  let!(:keyLocation) {KeyLocation.new(:name => "Kinnick Stadium")}

  describe "GET #new" do
    it "returns http success" do
      expect(User).to receive(:find_by).and_return(user)
      get :new, {"name" => "IMU" , "lat" => 200, "lng" => 100, "description" => "Iowa Memorial Union, Iowa City, IA"}
      expect(response).to have_http_status(:success)
    end
    
    it "creates new marker" do
      expect(User).to receive(:find_by).and_return(user)
      allow_any_instance_of(KeyLocation).to receive(:getInfoString).and_return("test string")
      post :new, {"name" => "IMU" , "lat" => 200, "lng" => 100}
      expect(assigns(:new_marker)).to include(:lat => "200", :lng => "100")
    end
  end
  
  describe "POST #assign" do
    it "assigns location to user" do
      expect(User).to receive(:find_by).and_return(user)
      expect(KeyLocation).to receive(:find_by).and_return(keyLocation)
      post :assign, {"location" => "Kinnick Stadium"}
    end
  end
  
  describe "DELETE #destroy" do
    it "destroys the key location" do
      delete :destroy
    end
  end
end