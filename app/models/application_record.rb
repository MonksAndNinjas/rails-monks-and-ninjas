class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def attr_keys
    attributes.keys[0..-3]
  end

  def get_data_type_for(key)
    column_for_attribute("#{key.to_s}").type.to_s
  end
end
