class SessionsController < ApplicationController
  def new

  end

  def create
    if auth_hash = request.env["omniauth.auth"]
      # user logs in or signs up via facebook
      user = User.find_or_create_by_omniauth(auth_hash)

      session[:user_id] = user.id

      redirect_to root_url
    else
      # user logs in normal route
      user = User.find_by(email: params[:user][:email])
      user = user.try(:authenticate, params[:user][:password])

      return redirect_to login_path unless user
      # redirects to /login if not a valid user
      session[:user_id] = user.id

      redirect_to root_url
    end
  end

  def destroy
    session.delete :user_id

    redirect_to root_url
  end
end
