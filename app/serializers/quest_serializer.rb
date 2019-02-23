class QuestSerializer < ActiveModel::Serializer
  attributes :description, :objective_id, :created_at

  def attributes(arg1, arg2)
      data = super
      data.delete :created_at if !scope[:extended_data]
      data
  end
end
