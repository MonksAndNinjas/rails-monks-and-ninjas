module NavBarHelper

  def display_nested_attribute_link(attr)
    set_nested_attribute_link_parameters(attr)

    if controller_name == attr
      return link_to @attr_name, @attr_path, class: "nav-link"
    elsif controller_name == "objectives" && attr == "quests"
      return link_to @attr_name, @attr_path, class: "nav-link"
   else
      return link_to @attr_name, @attr_path
    end
  end

  def display_home_link
    if controller_name == "static"
      return link_to 'Home', root_url, class: "nav-link"
    else
      return link_to 'Home', root_url
    end
  end

  def display_user_link
    if controller_name == "users" && (params[:action] == "show" || params[:action] == "edit")
      return link_to "#{@current_user.display_user_link}'s profile", @current_user, class: "nav-link"
    else
      return link_to "#{@current_user.display_user_link}'s profile", @current_user
    end
  end

  def display_sign_up
    if controller_name == "users" && params[:action] == "new"
      return link_to 'Sign Up', signup_path, class: "nav-link"
    else
      return link_to 'Sign Up', signup_path
    end
  end

  def display_log_in
    if controller_name == "sessions" && params[:action] == "new"
      return link_to 'Log In', login_path, class: "nav-link"
    else
      return link_to 'Log In', login_path
    end
  end
end
