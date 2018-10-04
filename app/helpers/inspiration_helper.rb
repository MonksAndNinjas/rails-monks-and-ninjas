module InspirationHelper

  def display_attribute_if_exists(inspiration_attribute, attribute = nil)
    if attribute == "content"
      return inspiration_attribute unless inspiration_attribute.blank?
    else
      return link_to inspiration_attribute, inspiration_attribute unless inspiration_attribute.blank?
    end
  end

  def display_label_if_exists(inspiration_attribute, attribute)
    return "#{attribute.capitalize}:" unless inspiration_attribute.blank?
  end
end
