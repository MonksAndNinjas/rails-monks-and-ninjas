class SubscriptionSerializer < ActiveModel::Serializer
  attributes :id, :name, :amount, :due_day
  belongs_to :user
end
