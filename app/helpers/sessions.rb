  def current_user
    @current_user ||= Users.get(session[:id]) if session[:id]
  end
