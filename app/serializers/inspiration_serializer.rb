class InspirationSerializer < ActiveModel::Serializer
  attributes :id, :source
  belongs_to :user
end
