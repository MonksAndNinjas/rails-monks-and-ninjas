class Subscription < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :amount, presence: true
  validates :due_date, presence: true
  #need to make validation method that the date is in the right format, otherwise redirect to login.
end
