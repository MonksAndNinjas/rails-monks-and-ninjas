module QuestsHelper
  def find_quest_info(id, objective_id)
    @quest = @current_user.quests.find_by_id(id)
    @objective = Objective.find_by(id: objective_id)
  end

  def build_quest(quest_params = nil, objective_id)
    @quest = @current_user.quests.build(quest_params)
    @objective = Objective.find_by(id: params[:objective_id])
  end
end
