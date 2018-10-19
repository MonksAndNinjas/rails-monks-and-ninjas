module InspirationLinksHelper

private
#assists in listing out all inspirations
  def display_inspirations_info_using(attr, key)
    display_label?(attr["#{key}"], "#{key}") if valid_nested_attribute_key?(key)

    display_nested_attribute?(attr["#{key}"], "#{key}") if valid_nested_attribute_key?(key)
  end
end
