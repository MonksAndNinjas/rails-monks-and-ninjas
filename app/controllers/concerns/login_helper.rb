module LoginHelper
#responsible for anything involving logging in and checking for every view
  private

  def omniauth_login_path(auth_hash)
  
    user = User.find_or_create_by_omniauth(auth_hash)

    session[:user_id] = user.id

    redirect_to user
  end

  def normal_login_path(params)
  #  raise params.inspect
    user = User.find_by(email: params[:user][:email])
    user = user.try(:authenticate, params[:user][:password])

    return redirect_to login_path unless user
# redirects to /login if not a valid user
    session[:user_id] = user.id

    redirect_to user
  end
# below is for before_action :require_login
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
