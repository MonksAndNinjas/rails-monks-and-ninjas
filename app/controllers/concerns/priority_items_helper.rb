module PriorityItemsHelper
  def reached_item_limit?
    return redirect_to priority_items_path unless @current_user.priority_items.size < 3
  end
end
#move to mode?
