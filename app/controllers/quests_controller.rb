class QuestsController < ApplicationController
  
  def create
    @quest = @current_user.quests.build(quest_params)

    @quest.save

    redirect_to objectives_path
  end

  private

  def quest_params
    params.require(:quest).permit(:user_id, :objective_id, :title, :description)
  end
end
