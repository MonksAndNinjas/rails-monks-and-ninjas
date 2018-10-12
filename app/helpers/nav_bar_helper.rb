module NavBarHelper
  def attributes_keys
    @current_user.nested_attributes_options.keys.collect { |key| key.to_s.gsub(":","") }
  end

  def set_attribute_link_parameters(attr)
    @attr_name = attr.gsub("_"," ").capitalize

    @attr_path = "/users/#{@current_user.id}/#{attr}"
    @attr_path = "/users/#{@current_user.id}/objectives" if attr == "quests"
 end

  def create_attribute_link(attr)
    set_attribute_link_parameters(attr)
    return link_to @attr_name, @attr_path
  end
end
