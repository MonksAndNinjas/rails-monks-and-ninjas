module DeleteHelper
  def delete(id, controller, path)

    if controller.to_s == "quests"# refactor
      path = "objectives"
      model = controller.singularize.capitalize.constantize
    elsif controller.include?("priority")
      model = PriorityItem
    elsif controller.include?("family")
      model = FamilyMember
    else
      model = controller.singularize.capitalize.constantize
    end

    model.find(id).destroy
    redirect_to(controller: "#{path}", action: 'index')
  end
end
