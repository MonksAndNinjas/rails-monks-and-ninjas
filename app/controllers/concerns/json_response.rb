module JsonResponse

  def compileResponse
    success = @current_user.update(user_params)
    attribute = @current_user.send(params[:user][:controller])[-1]
    messages = user_errors(@current_user) if !success

    value = {
      success: success,
      messages: messages,
      user_params: user_params,
      attribute: attribute
    }

    value
  end

end
