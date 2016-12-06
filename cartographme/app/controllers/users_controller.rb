class UsersController < ApplicationController

  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_filter :set_current_user, :only=> ['show', 'edit', 'update', 'delete']
  before_action :correct_user,   only: [:edit, :update]

  def index
    @users = User.search( params[:search])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    puts User
    @user = User.new(user_params)

    if @user.save
      log_in @user
      flash[:notice] = "Sign up successful! Welcome #{@user.email}"
      redirect_to login_path
    else
      render 'new'
    end  
  end
  
  #private
  # Use callbacks to share common setup or constraints between actions.
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
  
  def profile
  end
end
  
