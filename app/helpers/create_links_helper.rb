module CreateLinksHelper
#creates links for new, edit, show, and navbar
  private
#nav bar link
  def display_nested_attribute_link(attr)
    set_nested_attribute_link_parameters(attr)

    return link_to @attr_name, @attr_path
  end
#new link
  def display_add_item_link?(priority_items)
      #abstract out priority_items
      return link_to "Add Item", new_user_priority_item_path(@current_user) unless priority_items.size > 2
  end
#edit link
  def display_edit_link?(attribute)
    return link_to "E", double_nested_route(attribute) if valid_controller?("objective_id")

    return link_to "E", single_nested_route(attribute) if valid_controller?("edit")
  end
#show link
  def display_nested_attribute?(inspiration_attribute, attribute)

    case attribute

    when "content"
      return "<span> #{inspiration_attribute} </span><br>".html_safe unless inspiration_attribute.blank?

    else
      return "<span> #{link_to inspiration_attribute, inspiration_attribute} </span><br>".html_safe unless inspiration_attribute.blank?

    end
  end
end
