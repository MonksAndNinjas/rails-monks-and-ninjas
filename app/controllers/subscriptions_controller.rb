class SubscriptionsController < ApplicationController
  def index
    @subscriptions = @current_user.subscriptions
  end
end
