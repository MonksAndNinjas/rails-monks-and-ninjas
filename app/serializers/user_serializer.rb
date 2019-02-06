class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :birthdate, :email
end
