class SubscriptionsController < ApplicationController
  def index
    @subscriptions = @current_user.subscriptions
  end

  def new
    @subscription = @current_user.subscriptions.build
  end

  def create
    @subscription = @current_user.subscriptions.build(subscription_params)

    render_new_or_redirect_if_saved(@subscription, "subscriptions")
  end

  def destroy
    delete(params[:id], Subscription, "subscriptions")
  end

  private

  def subscription_params
    params.require(:subscription).permit(:name, :amount, :due_day)
  end
end
