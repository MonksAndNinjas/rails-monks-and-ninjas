module ViewsValidatorsHelper
#used for _list, _index, _form, and inspirations/show
  def valid_controller?(toggle_reason = nil)
#reason for toggling can be due to; links, objective_id, or edit
    case controller_name

    when "family_members"
      return true unless toggle_reason == "links" || toggle_reason == "objective_id"

      false
    when "inspirations"
      return true unless toggle_reason == "objective_id"

      false
    when "quests"
      false

    when "objectives"
      return false unless toggle_reason == "objective_id"

      true
    when "priority_items"
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
#validates for inspirations show page
  def valid_nested_attribute_key?(key)
    !!(key == "image" || key == "link" || key == "content" || key == "video")
  end
#should label be created in _form
  def valid_label?(key)
    !!(key.to_s == "id" || key.to_s == "user_id" || key.to_s == "objective_id")
  end
end
