class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
#range of keys that are needed for nested_attribute
  def attr_keys
    attributes.keys[0..-3]
  end
#assists in finding and putting key in proper format for _form
  def get_data_type_for(key)
    column_for_attribute("#{key.to_s}").type.to_s
  end
end
