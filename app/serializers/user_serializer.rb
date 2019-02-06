class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :birthdate, :email
  has_many :subscriptions
  has_many :family_members
  has_many :disciplines
end
