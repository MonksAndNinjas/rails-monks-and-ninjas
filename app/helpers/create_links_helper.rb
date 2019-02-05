module CreateLinksHelper
#creates links for new, edit, show
  private
#new link
  def display_add_item_link?(priority_items)
    return link_to "+", new_user_priority_item_path(@current_user), class: "comp-font blue" unless priority_items.size > 2
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
      return "<li> #{inspiration_attribute} </li><br>".html_safe unless inspiration_attribute.blank?
    when "about"
      return "<li> #{inspiration_attribute} </li><br>".html_safe unless inspiration_attribute.blank?
    else
      return "<li id='inspiration-link'> #{link_to inspiration_attribute, inspiration_attribute} </li><br>".html_safe unless inspiration_attribute.blank?
    end
  end
end
