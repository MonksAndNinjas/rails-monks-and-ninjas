class UsersController < ApplicationController
  skip_before_action :require_login, except: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    return render :new unless @user.save

    session[:user_id] = @user.id

    redirect_to @user
  end

  def show
  end

  def edit
  end

  def update
    return render :edit unless @current_user.update(user_params)

    redirect_to @current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :birthdate, :email, :password)
  end
end
