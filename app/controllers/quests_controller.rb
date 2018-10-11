class QuestsController < ApplicationController

  def new
    @quest = @current_user.quests.build
    @objective = Objective.find_by(id: params[:objective_id])
  end

  def edit
    @quest = @current_user.quests.find_by(id: params[:id])
    @objective = Objective.find_by(id: params[:objective_id])
  end

  def destroy
    delete(params[:id], Quest, "objectives")
  end
end
