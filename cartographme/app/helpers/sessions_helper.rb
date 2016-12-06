module SessionsHelper
  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end
  
    def current_user=(user)
    @current_user = user
  end

  def current_user
    session_token  = User.digest(cookies[:session_token])
    @current_user ||= User.find_by(session_token: session_token)
  end

  def current_user?(user)
    user == current_user
  end

  # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
  # Logs out the current user.
  def log_out
    reset_session 
    @current_user=nil
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end
end
