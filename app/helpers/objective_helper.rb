module ObjectiveHelper
  def quest_duration(quest)#move to objective mode? or quest mode?
    Objective.find_by_id(quest.objective_id).duration.capitalize
  end

  def type_of(objective)#this too
    "Go on #{objective.duration.capitalize} Quest"
  end
end
