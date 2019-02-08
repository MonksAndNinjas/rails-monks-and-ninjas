class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :birthdate, :email
  has_many :subscriptions, serializer: UserSubscriptionSerializer
  has_many :family_members
  has_many :disciplines
  has_many :inspirations
  has_many :quests
  has_many :priority_items
end
