class ApplicationController < ActionController::Base
  before_action :current_user
  before_action :require_login, except: [:home]

  include PriorityItemsHelper
  include DeleteHelper
  include RenderRedirectHelper
  include LoginHelper
  include SessionHelper
  include ParamHelper

  def index
    set_model(controller_name)
    @all_of_attribute = @current_user.send(@model)
  end

  def new
    set_model(controller_name)
    @attribute = @current_user.send(@model).build
  end

  def edit
    set_model(controller_name)
    @attribute = find_attribute(params[:id])
  end

  def destroy
    delete(params[:id], params[:controller], controller_name)
  end

  private

  def set_model(controller_name)
    @model = controller_name

    case @model

    when "quests"
      @objective = Objective.find_by(id: params[:objective_id])

    when "objectives"
      @model = "quests"
      @objectives = Objective.all
    end
  end

  def find_attribute(id_param)#move to application record model
    controller_name.singularize.capitalize.constantize.find_by(id: params[:id])
  end
end
