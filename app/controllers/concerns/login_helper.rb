module LoginHelper
  def logged_in?
    !!current_user
  end

  private

  def require_login
    return redirect_to root_url unless logged_in?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
