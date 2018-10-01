class UsersController < ApplicationController
  def new
  end

  def create
    user = User.create(user_params)

    session[:user_id] = user.id

    redirect_to root_url
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :birthdate, :email, :password)
  end
end
