module SessionHelper
  def omniauth_login_path(auth_hash)
    user = User.find_or_create_by_omniauth(auth_hash)

    session[:user_id] = user.id

    redirect_to user
  end

  def normal_login_path(params)
    user = User.find_by(email: params[:user][:email])
    user = user.try(:authenticate, params[:user][:password])

    return redirect_to login_path unless user
    # redirects to /login if not a valid user
    session[:user_id] = user.id

    redirect_to user
  end
end

# move to user class?