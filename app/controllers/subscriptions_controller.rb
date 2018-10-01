class SubscriptionsController < ApplicationController
  def index
    @subscriptions = @current_user.subscriptions
  end

  def new
    @subscription = Subscription.new
  end

  def create
    subscription = Subscription.new(subscription_params)

    if subscription.save
      redirect_to subscriptions_path
    else
      redirect_to new_subscription_path
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:name, :amount, :due_date)
  end
end
