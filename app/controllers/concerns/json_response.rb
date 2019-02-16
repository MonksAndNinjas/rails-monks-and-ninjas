module JsonResponse

  def compileResponse
    success = @current_user.update(user_params)
    messages = user_errors(@current_user) if !success

    value = {
      success: success,
      messages: messages,
      user_params: user_params
    }

    value
  end

end
