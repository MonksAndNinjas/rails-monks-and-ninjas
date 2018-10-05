module PriorityItemHelper

  def dont_display_add_item_link(priority_items)
      return link_to "Add Item", new_priority_item_path unless priority_items.size > 2
  end
end
