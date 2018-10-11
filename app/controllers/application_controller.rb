class ApplicationController < ActionController::Base
  before_action :current_user
  before_action :require_login, except: [:home]

  include PriorityItemsHelper
  include DeleteHelper
  include RenderRedirectHelper
  include LoginHelper
  include SessionHelper

  def index
    objective_or_quest?(controller_name)
    @all_of_attribute = @current_user.send(@model)
    #raise params.inspect
  end

  def new
    objective_or_quest?(controller_name)
    @attribute = @current_user.send(@model).build
  end

  def edit
    objective_or_quest?(controller_name)
    @attribute = controller_name.singularize.capitalize.constantize.find_by(id: params[:id])#move to application record model
  end

  def destroy
    delete(params[:id], params[:controller], controller_name)
  end

  private

  def objective_or_quest?(controller_name)
    @model = controller_name

    case @model

    when "quests"
      @objective = Objective.find_by(id: params[:objective_id])

    when "objectives"
      @model = "quests"
      @objectives = Objective.all
    end
  end
end
