module RenderRedirectHelper

  def render_new_or_redirect_and_set_session_if_saved(user)
    return render :new unless user.save

    session[:user_id] = user.id

    redirect_to user
  end

  def render_edit_or_redirect_updated_user(user, user_params)#refactor
    return render :edit unless @current_user.update(user_params)

    path = user_params.keys[1]

    case path

    when "family_member_attributes"
      redirect_to user_family_members_path(@current_user)#refactor

    when "subscriptions_attributes"
      redirect_to user_subscriptions_path(@current_user)

    when "priority_items_attributes"
      redirect_to user_priority_items_path(@current_user)

    when "disciplines_attributes"
      redirect_to user_disciplines_path(@current_user)

    when "inspirations_attributes"
      redirect_to user_inspirations_path(@current_user)

    when "quests_attributes"
      redirect_to user_objectives_path(@current_user)

    else
      redirect_to @current_user
    end
  end
end
