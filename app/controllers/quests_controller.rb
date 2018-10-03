class QuestsController < ApplicationController
  def new
    @quest = @current_user.quests.build
    @objective = Objective.find_by(id: params[:objective_id])
  end

  def create
    @quest = @current_user.quests.build(quest_params)
    @objective = Objective.find_by(id: params[:objective_id])

    if @quest.save
      redirect_to objectives_path
    else
      render :new
    end
  end

  private

  def quest_params
    params.require(:quest).permit(:user_id, :objective_id, :title, :description)
  end
end
