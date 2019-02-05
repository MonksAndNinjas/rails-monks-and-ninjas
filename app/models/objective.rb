class Objective < ApplicationRecord
  has_many :quests
  has_many :users, through: :quests

  validates :duration, presence: true
#for displaying in objectives#index short or long quest
  def type
    "#{duration.capitalize} Quest"
  end
end
