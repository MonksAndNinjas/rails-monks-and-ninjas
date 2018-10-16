module DeleteHelper
# need to know what kind of method label for module and also when to use private
  private
#assists in deleting object belonging to nested_attribute model
  def find_and_delete_using(id, controller, path)
    case controller
    #filters
    when "objectives"
      controller = "quests"
    when "quests"
      path = "objectives"
    end
    #set
    model = controller.singularize.camelize.constantize
    model.find(id).destroy
    #redirect
    return redirect_to(controller: "#{path}", action: 'index')
  end
end
