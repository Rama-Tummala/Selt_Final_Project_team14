require 'rails_helper'

RSpec.describe UsersController, type: :controller do


  describe "GET #new" do
   
    it 'should call the model method to create the user ' do
      allow(User).to receive(:create).with('Ted,ted@abc.com,123456,123456')
    post :create,{ :user => {:name =>'Ted',:email =>'ted@abc.com',:password =>'123456',:password_confirmation =>'123456'}}
   
    end 
   
end

it 'should select the Signup page for rendering' do
      allow(User).to receive(:create)
     # get :signup, user => {:name =>'Ted',:email =>'ted@abc.com',:password =>'123456',:password_confirmation =>'123456'}
     get :new,  {:name =>'Ted',:email =>'ted@abc.com',:password =>'123456',:password_confirmation =>'123456'}
      expect(response).to render_template('users/new')
    end 

end
