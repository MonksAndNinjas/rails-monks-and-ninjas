class Subscription < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :amount, presence: true
  # does it work for the right number
  validates :due_day, presence: true
  validates :due_day, :length => { :in => (1..28)}
end
