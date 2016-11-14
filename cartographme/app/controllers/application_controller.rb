class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protected
 # @current_user ||= User.find_by_session_token(cookies[:session_token])
 
  def set_current_user
      
       @current_user ||= session[:session_token]&& User.find_by_session_token(session[:session_token])
print ("@@@@@")
    print @current_user
    print ("$$$$$$$$$$$")
  end  

  def current_user?(id)
    @current_user.id.to_s == id
  end  
  
  
end
