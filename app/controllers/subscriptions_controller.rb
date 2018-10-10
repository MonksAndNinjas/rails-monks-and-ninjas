class SubscriptionsController < ApplicationController
  def index
    @subscriptions = @current_user.subscriptions
  end

  def new
    @subscription = @current_user.subscriptions.build
  end

  def destroy
    delete(params[:id], Subscription, "subscriptions")
  end
end
