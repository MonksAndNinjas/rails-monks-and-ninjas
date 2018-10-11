class PriorityItemsController < ApplicationController
  before_action :reached_item_limit?, only: [:new, :create]
end
