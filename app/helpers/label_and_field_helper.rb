module LabelAndFieldHelper
#responsible for displaying proper label and field for form.
  private
#for inspiration show page
  def display_label?(inspiration_attribute, key)
    return "<li>#{key.to_s.capitalize}:</li><br>".html_safe unless inspiration_attribute.blank?
  end
#for _form
  def display_field_using(key, data_type, attr)
    @data_type = data_type
#set data type
    valid_data_type?(key)

    case @data_type
#after filter pick type of field
    when "date"
      return attr.date_field "#{key.to_s}", name: "user[#{controller_name}_attributes][#{key.to_s}]", value: @nested_attribute["#{key.to_s}"]

    when "string"
      return attr.text_field "#{key.to_s}", name: "user[#{controller_name}_attributes][#{key.to_s}]", value: @nested_attribute["#{key.to_s}"]

    when "decimal"
      return attr.number_field "#{key.to_s}", name: "user[#{controller_name}_attributes][#{key.to_s}]",
       step: 0.01, value: (number_with_precision(@nested_attribute.amount, :precision => 2) || 0)

    when "integer"
      return attr.number_field "#{key.to_s}", name: "user[#{controller_name}_attributes][#{key.to_s}]"

    when "user_id"
      return attr.number_field "#{key.to_s}", name: "user[#{controller_name}_attributes][#{key.to_s}]", value: "#{@nested_attribute.user_id}", type: "hidden"

    when "objective_id"
      return attr.number_field "#{key.to_s}", name: "user[#{controller_name}_attributes][#{key.to_s}]", value: "#{params[:objective_id]}", type: "hidden"
#dependant on params[:objective_id]
    when "id"
      return attr.number_field "#{key.to_s}", name: "user[#{controller_name}_attributes][#{key.to_s}]", value: "#{@nested_attribute.id}", type: "hidden"
    end
  end
end
