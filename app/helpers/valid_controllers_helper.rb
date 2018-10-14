module ValidControllersHelper
#"edit" and "link"    make false
  def valid_controller?(object = nil)

    case controller_name
                                      #add option and edit
    when "family_members"
      return true unless object == "links" || object == "objective_id"

      false
    when "inspirations"
      return true unless object == "objective_id"

      false
    when "quests"
      false
    when "objectives"
      return false unless object == "objective_id"

      true      #don't create add option or edit
    when "priority_items"
      false


    when "disciplines"
      return true unless object == "edit" || object == "objective_id"

      false
    when "subscriptions"                                                      #add option no edit
      return true unless object == "edit" || object == "objective_id"

      false
    end
  end

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
end
