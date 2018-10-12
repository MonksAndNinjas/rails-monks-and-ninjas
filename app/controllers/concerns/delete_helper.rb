module DeleteHelper
  def delete(id, controller, path)

    #controller passes in controller_name

    case controller
    when "quests"#maybe refactor
      path = "objectives"
      model = controller.singularize.capitalize.constantize
    when "priority_itmes"
      model = PriorityItem
    when "family_members"
      model = FamilyMember
    else
      model = controller.singularize.capitalize.constantize
    end

    model.find(id).destroy
    redirect_to(controller: "#{path}", action: 'index')
  end
end
