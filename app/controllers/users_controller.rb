class UsersController < ApplicationController
  skip_before_action :require_login, except: [:show, :edit, :update]

  include JsonResponse

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
      format.json { render json: compileResponse, status: 201 }
    end
  end

  def user_data
    destination = params[:destination]
    user = User.find(params[:id])

    render json: user.to_json(only: [:name],
      include: [destination.to_sym => { only: [:id, :name, :title, :source] }]), status: 200
  end

  def display_quest
    inspect.params
  end
end
