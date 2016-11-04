class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by_email(params[:session][:email])
   #if user && user.authenticate(params[:session][:password])
   if user
     cookies.permanent[:session_token]= user.session_token
     flash[:notice] = "Login successful! Welcome"
    redirect_to home_index_path
  else
    flash[:warning] = "Invalid email/password combination.Try again"
    render 'new'
  end
  end  
end
