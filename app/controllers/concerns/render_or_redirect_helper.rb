module RenderOrRedirectHelper
#handles redirect for user login and validates
  private

  def render_new_or_redirect_and_set_session_if_saved(user)
  #  raise params.inspect
    success = user.save

    messages = user.errors.full_messages.collect { |msg| msg } if !success

    return redirect_to new_user_url, set: flash[:messages] = messages unless success

    session[:user_id] = user.id

    redirect_to user
  end
#handles redirects after creations or edits of nested attributes or user
  def render_edit_or_redirect_updated_user(user, user_params)
    #store update result
    success = user.update(user_params)
    #set values
    action = params[:user][:action]
    controller = params[:user][:controller]
    #set messages
    messages = @current_user.errors.full_messages.collect { |msg| msg } if !success
    #set path
    path = user_params.keys[1]
    path = "#{action}_#{controller}"  if !success && controller == "users"
    path = "#{action}_#{controller}"  if !success && controller == "quests"
    path = "error_#{action}"  if !success && non_quest_attribute

    case path

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

    when "new_quests"
      redirect_to quest_new_page, set: flash[:messages] = messages

    when "edit_quests"
      redirect_to quest_edit_page, set: flash[:messages] = messages

    when "edit_users"
      redirect_to edit_user_url, set: flash[:messages] = messages

    when "new_users"

    when "error_new"
      redirect_to attribute_new_page, set: flash[:messages] = messages

    when "error_edit"
      redirect_to attribute_edit_page, set: flash[:messages] = messages

    else
      redirect_to user
    end
  end






  def quest_new_page
    "/users/#{@current_user.id}/objectives/#{params[:user][:quests_attributes][:objective_id]}/#{params[:user][:controller]}/new"
  end

  def quest_edit_page
    "/users/#{@current_user.id}/objectives/#{params[:user][:quests_attributes][:objective_id]}/#{params[:user][:controller]}/#{params[:user][:quests_attributes][:id]}/edit"
  end

  def attribute_new_page
    "/users/#{@current_user.id}/#{params[:user][:controller]}/new"
  end

  def attribute_edit_page
    "/users/#{@current_user.id}/#{params[:user][:controller]}/#{params[:user]["#{params[:user][:controller]}_attributes"][:id]}/edit"
  end

  def non_quest_attribute
     controller = params[:user][:controller]

     !!(controller == "inspirations" || controller == "family_members" || controller == "subscriptions" || controller == "disciplines" || controller == "priority_items")
  end
end
