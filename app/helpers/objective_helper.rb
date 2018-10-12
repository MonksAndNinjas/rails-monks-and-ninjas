module ObjectiveHelper
  def quest_duration(quest)#where does this go
    Objective.find_by_id(quest.objective_id).duration.capitalize
  end

  def type_of(objective)#this too
    "Go on #{objective.duration.capitalize} Quest"
  end
end
