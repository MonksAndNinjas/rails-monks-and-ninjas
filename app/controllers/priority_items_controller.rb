class PriorityItemsController < ApplicationController
  before_action :reached_item_limit?, only: [:new, :create]

  def index
    @priority_items = @current_user.priority_items
  end

  def new
    @priority_item = @current_user.priority_items.build
  end

  def create
    @priority_item = @current_user.priority_items.build(priority_item_params)

    render_new_or_redirect_if_saved(@priority_item, "priority_items")
  end

  def destroy
    delete(params[:id], PriorityItem, "priority_items")
  end

  private

  def priority_item_params
    params.require(:priority_item).permit(:title, :description)
  end
end
