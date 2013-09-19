  def current_user
    if session[:id]
      @current_user ||= Users.find_by_id(session[:id])
    end
  end
