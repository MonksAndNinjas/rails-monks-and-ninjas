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

    return render :new unless @priority_item.save

    redirect_to priority_items_path
  end

  def destroy
    PriorityItem.find(params[:id]).destroy
    redirect_to priority_items_path
  end

  private

  def priority_item_params
    params.require(:priority_item).permit(:title, :description)
  end

  def reached_item_limit?
    return redirect_to priority_items_path unless @current_user.priority_items.size < 3
  end
end
