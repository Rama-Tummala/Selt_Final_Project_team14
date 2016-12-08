require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "index places gmap marker" do
    it "returns http success" do
      post :index
      expect(response).to have_http_status(:success)
    end
    
    it "assigns markers to gon" do
      fake_user = User.create(name: 'FAKE', email: "nada@gmail.com", password:"123456", password_confirmation:"123456")
      allow_any_instance_of(User).to receive(:key_locations).and_return([])
      allow(User).to receive(:find_by).and_return(fake_user)
      loc1=KeyLocation.find(1)
      loc2=KeyLocation.find(2)
      expect(KeyLocation).to receive(:all).and_return([loc1,loc2])
      allow_any_instance_of(KeyLocation).to receive(:getInfoString).and_return("")
      get :index
      expect(assigns(:all_markers)[0]).to include(:lat => loc1.lat, :lng => loc1.lng)
      expect(assigns(:all_markers)[1]).to include(:lat => loc2.lat, :lng => loc2.lng)
    end
    
    it "assigns green markers to visited" do
      fake_loc = KeyLocation.create(lat: 1,lng: 2,name:"fake",email:"admin")
      fake_user = User.create(name: 'FAKE', email: "nada@gmail.com", password:"123456", password_confirmation:"123456")
      allow_any_instance_of(User).to receive(:key_locations).and_return([fake_loc])
      allow(User).to receive(:find_by).and_return(fake_user)
      allow(KeyLocation).to receive(:all).and_return([fake_loc])
      puts(ActionController::Base.helpers.image_url('green_dot.png'))
      get :index
      expect(ActionController::Base)
    end
    
    
    it "assigns nothing if given keylocations returns nothing" do
      expect(KeyLocation).to receive(:all).and_return([])
      get :index
      expect(assigns(:all_markers)).to eql([])
    end
  end
  
end
 

