class ObjectivesController < ApplicationController
  def index
    @quests = @current_user.quests
    @objectives = Objective.all
  end

  #def update
  #  @objective = Object.find(params[:objective_id])
  #
  # @objective.update(objective_params)
  #end
end
