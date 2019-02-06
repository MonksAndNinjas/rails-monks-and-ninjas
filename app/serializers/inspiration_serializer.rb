class InspirationSerializer < ActiveModel::Serializer
  attributes :id, :source, :image, :link, :video, :content, :about
  belongs_to :user
end
