class FamilyMemberSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :birthdate, :relationship, :contact, :relationship_status
  belongs_to :user
end
