class QuestsController < ApplicationController

  def quests_data
    quest = Quest.find(params[:id])
    render json: quest, status: 200
  end

  def display_quest
    @quest = Quest.find_by(id: params[:quest_id])
    render "display_quest"
  end
end
