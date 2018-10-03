class Objective < ApplicationRecord
  has_many :quests
  has_many :users, through: :quests
  accepts_nested_attributes_for :quests

  validates :duration, presence: true
end
