class UsersController < ApplicationController
  skip_before_action :require_login, except: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    render_new_or_redirect_and_set_session_if_saved(@user)
  end

  def show
  end

  def edit
  end

  def update
    render_edit_or_redirect_updated_user(@current_user, user_params)
  end

  private

  def user_params
    params.require(:user).permit(:name, :birthdate, :email, :password,
      family_members_attributes: [
        :id,
        :name,
        :birthdate,
        :relationship,
        :location,
        :contact,
        :relationship_status
      ],
      subscriptions_attributes: [
        :id,
        :name,
        :amount,
        :due_day
      ],
      priority_items_attributes: [
        :id,
        :title,
        :description
      ],
      disciplines_attributes: [
        :id,
        :title,
        :content,
        :duration
      ])
  end
end
