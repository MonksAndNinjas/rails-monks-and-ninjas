class QuestSerializer < ActiveModel::Serializer
  attributes :description, :objective_id, :updatedAt, :createdAt

  def attributes(arg1, arg2)
    data = super

    if !scope[:extended_data]
      data.delete :createdAt
      data.delete :updatedAt
    end

    data
  end

  def createdAt
    object.created_at.strftime("%m-%d-%Y")
  end

  def updatedAt
    object.updated_at.strftime("%m-%d-%Y")
  end
end
