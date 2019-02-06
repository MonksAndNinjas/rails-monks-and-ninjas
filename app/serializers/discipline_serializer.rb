class DisciplineSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :duration
  belongs_to :user
end
