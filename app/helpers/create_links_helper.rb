module CreateLinksHelper
#creates links for new, edit, show
  private
#new link
  def display_add_item_link?(priority_items)
      #abstract out priority_items
      return link_to "+", new_user_priority_item_path(@current_user), class: "comp-font blue" unless priority_items.size > 2
  end
#edit link
  def display_edit_link?(attribute)
    return link_to show_svg('edit-icon.svg'), double_nested_route(attribute), class: "shadow" if valid_controller?("objective_id")
    # doesn't seem to work
    return link_to show_svg('edit-icon.svg'), single_nested_route(attribute), class: "shadow" if valid_controller?("edit")
  end
#show link
  def display_nested_attribute?(inspiration_attribute, attribute)

    case attribute

    when "content"
      return "<span class=#{"comp-font"}> #{inspiration_attribute} </span><br>".html_safe unless inspiration_attribute.blank?

    else
      return "<span class=#{"comp-font"}> #{link_to inspiration_attribute, inspiration_attribute} </span><br>".html_safe unless inspiration_attribute.blank?
    end
  end
end
