module PriorityItemsHelper
  def reached_item_limit?
    return redirect_to user_priority_items_path unless @current_user.priority_items.size < 3
  end
end
