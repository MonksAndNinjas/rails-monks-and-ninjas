class Objective < ApplicationRecord
  has_many :quests
  has_many :users, through: :quests

  validates :duration, presence: true

  def type
    "Go on #{duration.capitalize} Quest"
  end
end
