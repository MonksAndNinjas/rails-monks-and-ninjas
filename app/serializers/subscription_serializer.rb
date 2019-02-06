class SubscriptionSerializer < ActiveModel::Serializer
  attributes :id, :name, :amount, :due_day
end
