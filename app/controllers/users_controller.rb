class UsersController < ApplicationController
  skip_before_action :require_login, except: [:show, :edit, :update]

  def index
  end

  def new
    flash[:messages]
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

  def oldest
  end

  def update
    flash[:messages]
    redirect_updated_user(@current_user, user_params)
  end

  def my_life
    user = User.find(params[:id])
    render json: user, status: 200
  end
end
