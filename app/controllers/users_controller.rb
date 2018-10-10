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
        :name,
        :birthdate,
        :relationship,
        :location,
        :contact,
        :relationship_status
      ]
    )
  end
end
