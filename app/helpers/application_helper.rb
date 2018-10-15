module ApplicationHelper
#assist list and table partials
  def nested_attribute_keys
    @all_of_nested_attribute[0].attributes.keys[1..-4]
  end
#assist layout navbar links
  def nested_attributes_keys
    @current_user.nested_attributes_options.keys.collect { |key| key.to_s.gsub(":","") }
  end
#assist layout navbar links
  def set_nested_attribute_link_parameters(attr)
    @attr_name = attr.gsub("_"," ").capitalize

    return @attr_path = "/users/#{@current_user.id}/#{attr}" unless attr == "quests"

    @attr_path = "/users/#{@current_user.id}/objectives"
  end
#assist objective and quests edit link
  def double_nested_route(attribute)
    #figure out how to make it not dependent of objective_id, the abstract version of it
    "/users/#{@current_user.id}/#{controller_name}/#{attribute.objective_id}/#{attribute.class.to_s.downcase.pluralize}/#{attribute.id}/edit"
  end
#assist inspirations and family members edit link
  def single_nested_route(attribute)
    "/users/#{@current_user.id}/#{controller}/#{attribute.id}/edit"
  end
end
