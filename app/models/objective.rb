class Objective < ApplicationRecord
  has_many :quests
  has_many :users, through: :quests

  validates :title, presence: true
  validates :task, presence: true
end
