module RedirectHelper
#handles redirect for user login and validates
  private

  def redirect_and_set_session_if_saved(user)
#store update result
    success = user.save
#set messages
    messages = user_errors(user) if !success
#go to appropriate path
    return redirect_to signup_path, set: flash[:messages] = messages unless success

    session[:user_id] = user.id

    redirect_to user
  end


#handles redirects after creations or edits of nested attributes or user
  def redirect_updated_user(user, user_params)
    #store update result
    success = user.update(user_params)
    #set action
    action = params[:user][:action]
    #set messages
    messages = user_errors(user) if !success
    #set appropriate path
    path = user_params.keys[1]
    path = "#{action}_#{controller}"  if !success && controller == "users"
    path = "#{action}_#{controller}"  if !success && controller == "quests"
    path = "error_#{action}"  if !success && non_quest_attribute

    case path
#first set of paths are for attribute index pages
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
#next set of paths are for invalid update to user for quests new and edit
    when "new_quests"
      redirect_to quest_new_page, set: flash[:messages] = messages

    when "edit_quests"
      redirect_to quest_edit_page, set: flash[:messages] = messages
#these two sets are for invalid update to user for nested attributes new and edit
    when "error_new"
      redirect_to attribute_new_page, set:  flash[:messages] = messages

    when "error_edit"
      redirect_to attribute_edit_page, set:  flash[:messages] = messages
#lastly invalid update to user for editing user
    when "edit_users"
      redirect_to edit_user_url, set:  flash[:messages] = messages

    else
      redirect_to user
    end
  end


#assists in assembling appropriate path and listed in order of ascending line number
  def user_errors(user)
    user.errors.full_messages.collect { |msg| msg }
  end
#assists in quests new and edit paths
  def quest_new_page
    "/#{user_path}/#{objective_path}/#{controller}/new"
  end

  def quest_edit_page
    "/#{user_path}/#{objective_path}/#{controller}/#{params[:user][:quests_attributes][:id]}/edit"
  end
#assists in non_quest attributes new and edit paths
  def attribute_new_page
    "/#{user_path}/#{controller}/new"
  end

  def attribute_edit_page
    "/#{user_path}/#{controller}/#{params[:user]["#{controller}_attributes"][:id]}/edit"
  end
#assists in user edit path
  def user_path
    "users/#{@current_user.id}"
  end
#Reads back true or false for setting appropriate attribute path
  def non_quest_attribute
    !!(controller == "inspirations" || controller == "family_members" || controller == "subscriptions" || controller == "disciplines" || controller == "priority_items")
  end
#assists in finding objective path
  def objective_path
    "objectives/#{params[:user][:quests_attributes][:objective_id]}"
  end
#finds contrller name
  def controller
    params[:user][:controller]
  end
end
