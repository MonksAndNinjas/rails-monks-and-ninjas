class PriorityItemsController < ApplicationController
  #before_action :reached_item_limit?, only: [:new, :create]

  def priority_items_data
    priority_item = PriorityItem.find(params[:id])
    render json: priority_item, status: 200
  end
end
