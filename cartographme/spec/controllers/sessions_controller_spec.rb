require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  let!(:user) { User.new(:name => "User", :email => "user@useremail.com", :password => "password", :password_confirmation => "password") }

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "GET #create" do
    it "creates a new session" do
      expect(User).to receive(:find_by_email).and_return(user)
      get :create
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
