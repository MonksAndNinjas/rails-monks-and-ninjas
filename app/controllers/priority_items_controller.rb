class PriorityItemsController < ApplicationController
  before_action :reached_item_limit?, only: [:new, :create]

  def index
    @priority_items = @current_user.priority_items
  end

  def new
    @priority_item = @current_user.priority_items.build
  end

  def destroy
    delete(params[:id], PriorityItem, "priority_items")
  end
end
