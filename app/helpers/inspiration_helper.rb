module InspirationHelper

  def display_attribute_if_exists(inspiration_attribute, attribute)
    if attribute == "content"
      return inspiration_attribute unless inspiration_attribute.blank?
    else
      return link_to inspiration_attribute, inspiration_attribute unless inspiration_attribute.blank?
    end
  end

  def display_label_if_exists(inspiration_attribute, attribute)
    return "#{attribute.capitalize}:" unless inspiration_attribute.blank?
  end

  def valid_attribute_key?(key)
    !!(key == "image" || key == "link" || key == "content" || key == "video")
  end
end
