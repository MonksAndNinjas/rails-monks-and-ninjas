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
        #move into method in concerns
        success = @current_user.update(user_params)
        messages = user_errors(@current_user) if !success

        value = {
          success: success,
          action: params[:user][:controller],
          messages: messages
        }
        #all the way up to here
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
