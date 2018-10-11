class ApplicationController < ActionController::Base
  before_action :current_user
  before_action :require_login, except: [:home]

  include PriorityItemsHelper
  include DeleteHelper
  include RenderRedirectHelper
  include LoginHelper
  include SessionHelper
end
