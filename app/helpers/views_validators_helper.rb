module ViewsValidatorsHelper
#validates for views
  private
#used for _list, _index, _form, and inspirations/show
  def valid_controller?(toggle_reason = nil)
#reason for toggling can be due to; links, objective_id, or edit
    case controller_name

    when "priority_items"
      false
    when "quests"
      false

    when "objectives"
      return false unless toggle_reason == "objective_id"
      true
    when "inspirations"
      return true unless toggle_reason == "objective_id"
      false

    when "family_members"
      return true unless toggle_reason == "links" || toggle_reason == "objective_id"
      false

    when "disciplines"
      return true unless toggle_reason == "edit" || toggle_reason == "objective_id"
      false
    when "subscriptions"
      return true unless toggle_reason == "edit" || toggle_reason == "objective_id"
      false
    end
  end
#validates field type for form by setting appropriate data_type
  def valid_data_type?(key)
    @data_type = "integer" if @data_type.include?("integer")

    case key.to_s

    when "user_id"
      @data_type = "user_id"
    when "objective_id"
      @data_type = "objective_id"
    when "id"
      @data_type = "id"
    end
  end
#for _table
  def valid_for_quests?(key)
    !!(key == "user_id" && controller_name == "objectives")
  end
#for _table
  def valid_for_subscriptions?(key)
    !!(key == "amount" && controller_name == "subscriptions")
  end
#for _table
  def invalid_for_remaining_attributes?(key)
    !!(valid_for_quests?(key) || valid_for_subscriptions?(key))
  end
#for _list
  def valid_inspiration?(key)
    !!(key == "image" || key == "link" || key == "content" || key == "video" || key == "about")
  end
#for _form to not display label for ids
  def invalid_label?(key)
    !!(key == "id" || key == "objective_id" || key == "user_id")
  end
end
