module RenderRedirectHelper
  def render_new_or_redirect_if_saved(object, path)
    return render :new unless object.save

    redirect_to(controller: "#{path}", action: 'index')
  end

  def render_edit_or_redirect_if_updated(object, attribute_params, path)
    return render :edit unless object.update(attribute_params)

    redirect_to(controller: "#{path}", action: 'index')
  end

  def render_new_or_redirect_and_set_session_if_saved(user)
    return render :new unless user.save

    session[:user_id] = user.id

    redirect_to user
  end

  def render_edit_or_redirect_updated_user(user, user_params)
    return render :edit unless @current_user.update(user_params)

    redirect_to @current_user
  end
end
