class QuestsController < ApplicationController

  def quests_data
    extended_data = params[:extended_data] || false

    quest = Quest.find(params[:id])

    render json: quest, scope: { extended_data: extended_data }, status: 200
  end

  def display_quest
  end
end
