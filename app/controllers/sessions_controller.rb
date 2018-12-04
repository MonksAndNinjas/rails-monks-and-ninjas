class SessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
    flash[:messages]
    return redirect_to root_url, notice: "*Already logged in*" if @current_user
  end

  def create
    if auth_hash = request.env["omniauth.auth"]
#user logs in or signs up via facebook
      omniauth_login_path(auth_hash)
    else
#user logs in normal route
      normal_login_path(params)
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_url
  end
end
