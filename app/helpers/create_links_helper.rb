module CreateLinksHelper
  def nested_attributes_keys
    @current_user.nested_attributes_options.keys.collect { |key| key.to_s.gsub(":","") }
  end

  def create_nested_attribute_link(attr)
    set_nested_attribute_link_parameters(attr)
    #do I need return?
    return link_to @attr_name, @attr_path
  end

  def display_edit_link?(attribute)
    return link_to "E", double_nested_route(attribute) if valid_controller?("objective_id")
    #filters here
    return link_to "E", single_nested_route(attribute) if valid_controller?("edit")
  end

  private

  def set_nested_attribute_link_parameters(attr)
    @attr_name = attr.gsub("_"," ").capitalize

    return @attr_path = "/users/#{@current_user.id}/#{attr}" unless attr == "quests"  #filter here

    @attr_path = "/users/#{@current_user.id}/objectives"
  end

  def double_nested_route(attribute)
    #figure out how to make it not dependent of objective_id, the abstract version of it
    "/users/#{@current_user.id}/#{controller_name}/#{attribute.objective_id}/#{attribute.class.to_s.downcase.pluralize}/#{attribute.id}/edit"
  end

  def single_nested_route(attribute)
    "/users/#{@current_user.id}/#{controller}/#{attribute.id}/edit"
  end
end
