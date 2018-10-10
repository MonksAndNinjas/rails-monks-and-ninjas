module PriorityItemHelper

  def dont_display_add_item_link(priority_items)
      return link_to "Add Item", new_user_priority_item_path(@current_user) unless priority_items.size > 2
  end
end
