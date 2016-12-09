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
   
  def destroy
    reset_session 
    @current_user=nil
    flash[:notice]= 'You have logged out'
    redirect_to home_index_path
  end
 
end