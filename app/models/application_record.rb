class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def nested_attributes_keys
    attributes.keys[0..-3]
  end

  def create_label?(key)
    !!(key.to_s == "id" || key.to_s == "user_id" || key.to_s == "objective_id")
  end

  def get_data_type_for(key)
    column_for_attribute("#{key.to_s}").type.to_s
  end
end
