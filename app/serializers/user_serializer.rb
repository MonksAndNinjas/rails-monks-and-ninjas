class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :birthdate, :email
  has_many :subscriptions
end
