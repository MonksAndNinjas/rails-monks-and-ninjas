class QuestsController < ApplicationController

  def new
  end

  def create
    @objective = @current_user.objectives.new(id: params[:quest][:objective_id])
    @quest = Quest.new(quest_params)

    redirect_to new_objective_path
  end

  private

  def quest_params
    params.require(:quest).permit(:user_id, :objective_id)
  end
end
