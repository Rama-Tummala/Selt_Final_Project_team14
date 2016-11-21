require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  let!(:user) { User.create(:name => "User", :email => "user@useremail.com", :password => "password", :password_confirmation => "password") }
  let!(:michael) { User.new(:name => "michael", :email => "michael@useremail.com", :password => "password", :password_confirmation => "password") }
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "GET #create" do
    it "creates a new session" do
     
    fake_results = [double('user1')]
      expect(User).to receive(:find_by_email).with('ted@abc.com').
       and_return(fake_results)
     post :create, {:email =>'ted@abc.com'}
    # User.new(:name => "User", :email => "user@useremail.com", :password => "password", :password_confirmation => "password")
    # user = User.find_by_email('user@useremail.com')
    # expect(response).to eq('User')
   # expect(user && user.authenticate('password'))
    expect(flash[:notice]).to eq ('Login successful! Welcome #{user.email}')
    
     
    end
  end
  
  describe "DELETE #destroy" do
    it "destroys a session" do
      session[:user_id] = user.email
      delete :destroy
      flash[:notice].match "You have logged out"
    end
  end

end
