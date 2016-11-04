class UsersController < ApplicationController

  before_filter :set_current_user, :only=> ['show', 'edit', 'update', 'delete']
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  # GET /users
  # GET /users.json
  def index
    #@users = User.search(params[:search])
    if params[:search]
      @users = User.where("username LIKE ?", "%#{params[:search]}%")
      #if @users.empty
      
    else
      # Please enter search term
      @users = User.all
    end
    #@users = User.all
  end
  
  def show
    @user = User.find(params[:id])
 #   @user = @current_user

  end

  def new
    
  end

  def create
    puts User
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Sign up successful! Welcome"
      redirect_to login_path
    else
      render 'new'
    end  
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :password)
    end
    
    def profile
    end
    
    def following
    end
end