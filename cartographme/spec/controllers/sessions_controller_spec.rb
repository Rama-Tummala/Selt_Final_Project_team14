require 'rails_helper'
require 'spec_helper'
require 'factory_girl'


RSpec.describe SessionsController, type: :controller do

  let!(:user) { User.create(:name => "User", :email => "user@useremail.com", :password => "password", :password_confirmation => "password") }
  #let!(:michael) { User.new(:name => "michael", :email => "michael@useremail.com", :password => "password", :password_confirmation => "password") }
  #let!(:user_1) { User.create(:name => "arahan", :email => "arahan@useremail.com", :password => "arahan", :password_confirmation => "arahan") }
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "GET #create" do
    it "creates a new session" do
     
     #User = create(:user)
    expect(User).to receive(:find_by_email).with("suman.474@gmail.com")#.and_return('user')
    
    post :create, :session =>{:email =>'suman.474@gmail.com',:password =>'sumank'}
    # User.new(:name => "User", :email => "user@useremail.com", :password => "password", :password_confirmation => "password")
   
    
   # expect(user && user.authenticate('password'))
    expect(flash[:notice])
    #.to eq ('Login successful! Welcome #{user.email}')
    
     
    end
  end
  
  context "with blank credentials" do
          it "renders the new template" do
            post :create
            expect(response).to render_template('new')
          end
        end
  
  describe "DELETE #destroy" do
   # let!(:user) { User.new(:name => "User", :email => "user@useremail.com", :password => "password", :password_confirmation => "password") }
    it "destroys a session" do
     
      session[:user_id] = user.email
      delete :destroy
      flash[:notice].match "You have logged out"
    end
  end

end
