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
    user = User.find(params[:id])
    render json: user, status: 200
  end

  def family_members
    user = User.find(params[:id])
    render json: user.family_members, status: 200
  end

  def subscriptions
    user = User.find(params[:id])
    render json: user.subscriptions, status: 200
  end

  def disciplines
    user = User.find(params[:id])
    render json: user.disciplines, status: 200
  end

  def inspirations
    user = User.find(params[:id])
    render json: user.inspirations, status: 200
  end

  def quests
    user = User.find(params[:id])
    render json: user.quests, status: 200
  end

  def priority_items
    user = User.find(params[:id])
    render json: user.priority_items, status: 200
  end

  def my_life
  end
end
