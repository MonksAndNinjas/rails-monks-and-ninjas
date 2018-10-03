class PriorityItemsController < ApplicationController

  def index
    @priority_items = PriorityItem.all
  end

  def create
  end

  def destroy
  end
end
