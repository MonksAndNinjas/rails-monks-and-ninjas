class Quest < ApplicationRecord
  belongs_to :user
  belongs_to :objective

  validates :title, presence: true
  validates :description, presence: true
#for displaying in objectives#index page with partial _table
  def quest_duration
    Objective.find_by_id(self.objective_id).duration.capitalize
  end
end
