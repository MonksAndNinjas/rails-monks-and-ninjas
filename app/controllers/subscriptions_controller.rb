class SubscriptionsController < ApplicationController

  def subscriptions_data
    subscription = Subscription.find(params[:id])
    render json: subscription, status: 200
  end
end
