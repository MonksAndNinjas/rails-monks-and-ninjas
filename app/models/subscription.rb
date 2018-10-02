class Subscription < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :amount, presence: true
  validates :amount, length: { minimum: 1 }
  validates :due_day, presence: true
  validates :due_day, :length => { :in => (1..28)}

  include ActionView::Helpers::NumberHelper

  def payment
    number_with_precision(amount, :precision => 2 )
  end
end
