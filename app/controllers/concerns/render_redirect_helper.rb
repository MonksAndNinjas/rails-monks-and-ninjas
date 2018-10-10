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

    if params[:user][:family_members_attributes]
      redirect_to user_family_members_path(@current_user)
    elsif params[:user][:subscriptions_attributes]
      redirect_to user_subscriptions_path(@current_user)
    elsif params[:user][:priority_items_attributes]
      redirect_to user_priority_items_path(@current_user)
    elsif params[:user][:disciplines_attributes]
      redirect_to user_disciplines_path(@current_user)
    elsif params[:user][:inspirations_attributes]
      redirect_to user_inspirations_path(@current_user)
    else
      redirect_to @current_user
    end
  end
end
