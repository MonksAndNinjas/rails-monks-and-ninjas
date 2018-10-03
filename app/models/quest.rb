class Quest < ApplicationRecord
  belongs_to :user
  belongs_to :objective

  validates :title, presence: true
  validates :description, presence: true
end
