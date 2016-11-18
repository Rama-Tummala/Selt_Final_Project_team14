class SessionsController < ApplicationController
  skip_before_filter :set_current_user
  
 def user_params
    params.require(:session).permit(:email, :password)
 end
 
 def new
    # default: render 'new' template
 end
 def create
  user = User.find_by_email(params[:session][:email])
  if user && user.authenticate(params[:session][:password])
  #  cookies.permanent[:session_token]= user.session_token
   session[:session_token]=user.session_token
   flash[:notice] = "Login successful! Welcome #{user.email}"
   redirect_to home_index_path
  else
   flash[:warning] = "Invalid email/password combination.Try again"
   render 'new'
  end
 end 
 
=begin 
def create
    
 #    @user_temp = User.new(user_params)
    puts %%%
    puts user_params
    
    @temp = User.find_by_email(@user_temp[:email])
    puts ####
    puts @temp
    puts ####
   # if (@temp.present? && @temp.password == user_params[:password])
      if @temp.present?
    flash[:notice]=" You are logged in as #{@temp.user_id}." 
    session[:session_token]=@temp.session_token
    redirect_to home_index_path   
     else
     flash[:warning] = "Invalid user-id/email"
    render 'new'
   end
=end   
   
  def destroy
    reset_session 
    @current_user=nil
    flash[:notice]= 'You have logged out'
    redirect_to home_index_path
  end
 
end
