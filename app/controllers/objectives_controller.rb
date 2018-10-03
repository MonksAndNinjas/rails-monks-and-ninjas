class ObjectivesController < ApplicationController

  def index
    @quests = @current_user.quests
    @objectives = Objective.all
  end

  def show
    @objective = Objective.find_by(id: params[:id])
  end
end
