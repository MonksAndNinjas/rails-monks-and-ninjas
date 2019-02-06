class QuestSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :objective_id
  belongs_to :user
end
