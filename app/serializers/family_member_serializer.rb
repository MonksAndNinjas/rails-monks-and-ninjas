class FamilyMemberSerializer < ActiveModel::Serializer
  attributes :location, :birthdate, :relationship, :contact, :relationship_status
end
