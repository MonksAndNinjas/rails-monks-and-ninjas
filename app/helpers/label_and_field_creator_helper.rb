module LabelAndFieldCreatorHelper
  def create_field_using(key, data_type, attr)
    #filter all ids and label proper data type        refactor?
    data_type = "integer" if data_type.include?("integer")
    data_type = "user_id" if key.to_s == "user_id"
    data_type = "objective_id" if  key.to_s == "objective_id"
    data_type = "id" if key.to_s == "id"

    case data_type
    #after filter pick type of field
    when "date"
      return attr.date_field "#{key.to_s}", name: "user[#{controller_name}_attributes][#{key.to_s}]"

    when "string"
      return attr.text_field "#{key.to_s}", name: "user[#{controller_name}_attributes][#{key.to_s}]"

    when "decimal"
      return attr.number_field "#{key.to_s}", name: "user[#{controller_name}_attributes][#{key.to_s}]"

    when "integer"
      return attr.number_field "#{key.to_s}", name: "user[#{controller_name}_attributes][#{key.to_s}]"

    when "user_id"
      return attr.number_field "#{key.to_s}", name: "user[#{controller_name}_attributes][#{key.to_s}]", value: "#{@nested_attribute.user_id}", type: "hidden"

    when "objective_id"
      return attr.number_field "#{key.to_s}", name: "user[#{controller_name}_attributes][#{key.to_s}]", value: "#{params[:objective_id]}", type: "hidden"

    when "id"
      return attr.number_field "#{key.to_s}", name: "user[#{controller_name}_attributes][#{key.to_s}]", value: "#{@nested_attribute.id}", type: "hidden"
    end
  end
  #for inspirations
  def display_nested_attribute_if_exists(inspiration_attribute, attribute)

    case attribute

    when "content"
      return inspiration_attribute unless inspiration_attribute.blank?
    else
      return link_to inspiration_attribute, inspiration_attribute unless inspiration_attribute.blank?
    end
  end

  def display_label_if_exists(inspiration_attribute, attribute)
    return "#{attribute.capitalize}:" unless inspiration_attribute.blank?
  end

  def valid_nested_attribute_key?(key)
    !!(key == "image" || key == "link" || key == "content" || key == "video")
  end
end
