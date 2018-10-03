class Objective < ApplicationRecord
  validates :title, presence: true
  validates :task, presence: true
end
