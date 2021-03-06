class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :set_current_user

  protected
  def set_current_user
      
    @current_user ||= session[:session_token]&& User.find_by_session_token(session[:session_token])
    print ("@@@@@")
    print @current_user
    print ("$$$$$$$$$$$")
  end  

  def current_user?(id)
    @current_user.id.to_s == id
  end  
  
  helper_method :current_user
  
end