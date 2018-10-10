class Objective < ApplicationRecord
  has_many :quests
  has_many :users, through: :quests

  validates :duration, presence: true
end
