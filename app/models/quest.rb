class Quest < ApplicationRecord
  belongs_to :user
  belongs_to :objective

  validates :title, presence: true
  validates :description, presence: true

  #def quest_duration(quest)#where does this go
  #  Objective.find_by_id(quest.objective_id).duration.capitalize
  #end
end
