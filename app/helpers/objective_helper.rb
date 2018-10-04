module ObjectiveHelper
  def quest_duration(quest)
    Objective.find_by_id(quest.objective_id).duration.capitalize
  end

  def type_of(objective)
    "Go on #{objective.duration.capitalize} Quest"
  end
end
