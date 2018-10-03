class ObjectivesController < ApplicationController

  def index
    @quests = @current_user.quests
    @objectives = Objective.all
  end
end
