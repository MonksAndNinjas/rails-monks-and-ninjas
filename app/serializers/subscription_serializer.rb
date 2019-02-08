class SubscriptionSerializer < ActiveModel::Serializer
  attributes :amount, :due_day
  belongs_to :user
end
