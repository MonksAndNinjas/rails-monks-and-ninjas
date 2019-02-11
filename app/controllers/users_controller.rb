class UsersController < ApplicationController
  skip_before_action :require_login, except: [:show, :edit, :update]

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

    respond_to do |format|
      format.html { redirect_updated_user(@current_user, user_params) }
      format.json {
        value = {
          success: @current_user.update(user_params),
          data: user_params
        }

        render json: value, status: 201
      }
    end
  end

  def user_data
    user = User.find(params[:id])
    render json: user, status: 200
  end

  def my_life
  end
end
