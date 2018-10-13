module ApplicationHelper

  def create_field(key, a, attr, association = nil)

    a = "integer" if a.include?("integer")
    a = "user_id" if key.to_s == "user_id"
    a = "objective_id" if key.to_s == "objective_id"
    a = "id" if key.to_s == "id"

    case a

    when "date"
      return attr.date_field "#{key.to_s}", name: "user[#{controller_name}_attributes][#{key.to_s}]"

    when "string"
      return attr.text_field "#{key.to_s}", name: "user[#{controller_name}_attributes][#{key.to_s}]"

    when "decimal"
      return attr.number_field "#{key.to_s}", name: "user[#{controller_name}_attributes][#{key.to_s}]"

    when "integer"
      return attr.number_field "#{key.to_s}", name: "user[#{controller_name}_attributes][#{key.to_s}]"

    when "user_id"
      return attr.number_field "#{key.to_s}", name: "user[#{controller_name}_attributes][#{key.to_s}]", value: "#{@attribute.user_id}", type: "hidden"

    when "objective_id"
      return attr.number_field "#{key.to_s}", name: "user[#{controller_name}_attributes][#{key.to_s}]", value: "#{@association.id}", type: "hidden"

    when "id"
      return attr.number_field "#{key.to_s}", name: "user[#{controller_name}_attributes][#{key.to_s}]", value: "#{@attribute.id}", type: "hidden"
    end
  end
end
