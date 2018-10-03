class QuestsController < ApplicationController

  def new
  end

  def create
    quest = Quest.new(quest_params)

    redirect_to objectives_path
  end

  private

  def quest_params
    params.require(:quest).permit(:user_id, :objective_id)
  end
end
