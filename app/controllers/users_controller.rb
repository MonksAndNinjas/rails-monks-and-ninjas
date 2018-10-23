class UsersController < ApplicationController
  skip_before_action :require_login, except: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    redirect_and_set_session_if_saved(@user)
  end

  def show
  end

  def edit
  end

  def update
    flash[:messages]
    redirect_updated_user(@current_user, user_params)
  end
end
