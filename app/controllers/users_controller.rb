class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id

      redirect_to @user
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @current_user.update(user_params)
    redirect_to @current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :birthdate, :email, :password)
  end
end
