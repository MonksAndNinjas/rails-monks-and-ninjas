class Inspiration < ApplicationRecord
  belongs_to :user

  validates :source, presence: true
  validates :about, presence: true
end
