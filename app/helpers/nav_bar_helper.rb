module NavBarHelper
#nav bar link
  def display_nested_attribute_link(attr)                
    set_nested_attribute_link_parameters(attr)
#refactor this code along with the one in navbar
    if controller_name == attr
      return link_to @attr_name, @attr_path, class: "comp-font shadow"
   else
      return link_to @attr_name, @attr_path
    end
  end

  def display_home_link
    if controller_name == "static"
      return link_to 'Home', root_url, class: "comp-font shadow"
    else
      return link_to 'Home', root_url
    end
  end

  def display_user_link
    if controller_name == "users" && params[:action] == "show"
      return link_to "#{@current_user.name}'s profile", @current_user, class: "comp-font shadow"
    else
      return link_to "#{@current_user.name}'s profile", @current_user
    end
  end

  def display_sign_up
    if controller_name == "users" && params[:action] == "new"
      return link_to 'Sign Up', signup_path, class: "comp-font shadow"
    else
      return link_to 'Sign Up', signup_path
    end
  end

  def display_log_in
    if controller_name == "sessions" && params[:action] == "new"
      return link_to 'Log In', login_path, class: "comp-font shadow"
    else
      return link_to 'Log In', login_path
    end
  end
end
