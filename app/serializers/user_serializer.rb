class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :birthdate, :email
  has_many :subscriptions, serializer: UserSubscriptionSerializer
  has_many :family_members, serializer: UserFamilyMemberSerializer
  has_many :disciplines, serializer: UserDisciplineSerializer
  has_many :inspirations, serializer: UserInspirationSerializer
  has_many :quests
  has_many :priority_items, serializer: UserPriorityItemSerializer
end
