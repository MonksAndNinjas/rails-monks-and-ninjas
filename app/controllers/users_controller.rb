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
    #raise params.inspect
    #render_edit_or_redirect_updated_user(@current_user, user_params)
    return render :edit unless @current_user.update(user_params)

    redirect_to @current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :birthdate, :email, :password,
      family_member: [
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
