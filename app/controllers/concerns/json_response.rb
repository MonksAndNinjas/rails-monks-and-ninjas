module JsonResponse

  def compileResponse
    success = @current_user.update(user_params)
    messages = user_errors(@current_user) if !success

    value = {
      success: success,
      action: params[:user][:controller],
      messages: messages,
      user: @current_user,
      user_params: user_params,
      id: @current_user.id
    }

    value
  end

end
