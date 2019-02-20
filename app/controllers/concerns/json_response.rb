module JsonResponse

  def compileResponse
    success = @current_user.update(user_params)
    attr = "#{params[:user][:controller]}_attributes"

    action = "edit"
    attribute = user_params["#{attr}"]

    messages = user_errors(@current_user) if !success
    action = "new" if attribute[:id] == ""
    attribute = @current_user.send(params[:user][:controller])[-1] if action == "new"
    attribute = user_params["#{attr}"] if !success

    value = {
      success: success,
      messages: messages,
      attribute: attribute,
      action: action,
    }

    value
  end

end
