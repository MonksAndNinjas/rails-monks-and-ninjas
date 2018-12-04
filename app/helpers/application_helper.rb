module ApplicationHelper
#various types of assistive methods
  private
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

    return @attr_path = "/#{users_path}/#{attr}" unless attr == "quests"

    @attr_path = "/#{users_path}/objectives"
  end
#assist objective and quests edit link
  def double_nested_route(attribute)
#figure out how to make it not dependent of objective_id, the abstract version of it
    "/#{users_path}/#{controller_name}/#{attribute.objective_id}/#{attribute.class.to_s.downcase.pluralize}/#{edit_path(attribute)}"
  end
#assist inspirations and family members edit link
  def single_nested_route(attribute)# fix the controller vs controller_name above
    "/#{users_path}/#{controller}/#{edit_path(attribute)}"
  end
#assist putting in presentable format
  def proper_format(object)
    object.gsub("_"," ").split.map(&:capitalize).join(' ')
  end
#assists in setting appropriate  url path
  def users_path
    "users/#{@current_user.id}"
  end
#assists in setting appropriate url path
  def edit_path(attribute)
    "#{attribute.id}/edit"
  end
#assists in _list and _table partial
  def user_attr_path(controller_name, attr)
    "#{users_path}/#{controller_name}/#{attr.id}"
  end
end
