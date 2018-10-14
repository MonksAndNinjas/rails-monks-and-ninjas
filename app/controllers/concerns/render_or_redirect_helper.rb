module RenderOrRedirectHelper

  def render_new_or_redirect_and_set_session_if_saved(user)
    return render :new unless user.save

    session[:user_id] = user.id

    redirect_to user
  end

  def render_edit_or_redirect_updated_user(user, user_params)
    return render :edit unless user.update(user_params)

    nested_attribute = user_params.keys[1]

    case nested_attribute

    when "family_member_attributes"
      redirect_to user_family_members_path(user)

    when "subscriptions_attributes"
      redirect_to user_subscriptions_path(user)

    when "priority_items_attributes"
      redirect_to user_priority_items_path(user)

    when "disciplines_attributes"
      redirect_to user_disciplines_path(user)

    when "inspirations_attributes"
      redirect_to user_inspirations_path(user)

    when "quests_attributes"
      redirect_to user_objectives_path(user)

    when "family_members_attributes"
      redirect_to user_family_members_path(user)

    else
      redirect_to user
    end
  end
end
