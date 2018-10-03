class PriorityItemsController < ApplicationController

  def index
    @priority_items = @current_user.priority_items
    @priority_item = @current_user.priority_items.build
  end

  def create
    @priority_item = @current_user.priority_items.build(priority_item_params)

    if @priority_item.save
      redirect_to priority_items_path
    else
      render :index
    end
  end

  def destroy
  end

  private

  def priority_items_params
    params.require(:priority_item).permit(:title, :content)
  end
end
