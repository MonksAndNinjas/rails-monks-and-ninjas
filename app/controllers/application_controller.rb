class ApplicationController < ActionController::Base
#do I need forgery protection
  before_action :current_user
  before_action :require_login, except: [:home]
#how to include all helpers in one command
  include DeleteHelper
  include RedirectHelper
  include LoginHelper
  include UserParamsHelper
#all of the crud options are listed here for nested_attributes
  def index
    set_model_for(controller_name)
    @all_of_nested_attribute = @current_user.send(@model)
  end

  def new
    flash[:messages]
    set_model_for(controller_name)
    @nested_attribute = @current_user.send(@model).build
  end

  def show
    @nested_attribute = find_nested_attribute
  end

  def edit
    flash[:messages]
    set_model_for(controller_name)
    @nested_attribute = find_nested_attribute
  end

  def destroy
    find_and_delete_using(params[:id], params[:controller], controller_name)
  end

  private
#for show and edit views
  def find_nested_attribute
    controller_name.singularize.camelize.constantize.find_by(id: params[:id])
  end
#for priority itmes, only 3 items can be created
  def reached_item_limit?
    return redirect_to user_priority_items_path unless @current_user.priority_items.size < 3
  end
#to be used for double nested attribute (objective, quest)
  def set_model_for(controller_name)

    @model = controller_name
#filters
    case @model

    when "quests"
      @objective = Objective.find_by(id: params[:objective_id])

    when "objectives"
      @model = "quests"
      @objectives = Objective.all
    end
  end
end
