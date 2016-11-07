require 'rails_helper'

RSpec.describe KeyLocationController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    
    it "creates new marker" do
      allow_any_instance_of(KeyLocation).to receive(:getInfoString).and_return("test string")
      post :new, {"name" => "IMU" , "lat" => 200, "lng" => 100}
      expect(assigns(:new_marker)).to include(:infowindow => "test string", :lat => "200", :lng => "100")
    end
  end

end
