require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  before do
    @user = users(:michael)
    @other_user = users(:archer)
  end
  
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "redirect #following if not logged in" do
    it "should redirect following when not logged in" do
      get following_user_path(@user)
      assert_redirected_to login_url
    end
  end

  describe "redirect #followers if not logged in" do
    it "should redirect followers when not logged in" do
    get followers_user_path(@user)
    assert_redirected_to login_url
    end
  end
  
  # describe 'searching users' do
  #   it 'should call the model method that performs user search' do
  #     fake_results = [double('Rama'), double('Josh')]
  #     expect(User).to receive(:search).with('Rama').
  #       and_return(fake_results)
  #     post :index, {:search_terms => 'Rama'}
  #   end
  #   it 'should select the Search Results template for rendering' do
  #     allow(User).to receive(:search)
  #     post :index, {:search_terms => 'Rama'}
  #     expect(response).to render_template('index')
  #   end  
  #   it 'should make the TMDb search results available to that template' do
  #     fake_results = [double('Rama'), double('Josh')]
  #     allow(User).to receive(:search).and_return (fake_results)
  #     post :index, {:search_terms => 'Rama'}
  #     expect(assigns(:movies)).to eq(fake_results)
  #   end 
  # end

end
