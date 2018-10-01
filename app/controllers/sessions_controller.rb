class SessionsController < ApplicationController
  def new
  end

  def create
    if auth_hash = request.env["omniauth.auth"]
      # user logs in using omniauth via facebook
      oauth_email = request.env["omniauth.auth"]["email"]
      if user = User.find_by(:email => oauth_email)

        session[:user_id] = user.id
      else
        user = User.create(:email => oath_email)
        oauth_email
      end
    else
      # user logs in normal route without omniauth
      user = User.find_by(email: params[:user][:email])
      user = user.try(:authenticate, params[:user][:password])

      return redirect_to login_path unless user

      session[:user_id] = user.id

      redirect_to root_url
    end
  end

  def destroy
    session.delete :user_id

    redirect_to root_url
  end

  private

  #def auth
  #  request.env['omniauth.auth']
  #end
end
