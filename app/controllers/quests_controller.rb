class QuestsController < ApplicationController

  def quests_data
    quest = Quest.find(params[:id])
    render json: quest, status: 200
  end
end
