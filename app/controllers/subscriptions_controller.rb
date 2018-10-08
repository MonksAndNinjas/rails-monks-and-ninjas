class SubscriptionsController < ApplicationController
  def index
    @subscriptions = @current_user.subscriptions
  end

  def new
    @subscription = @current_user.subscriptions.build
  end

  def create
    @subscription = @current_user.subscriptions.build(subscription_params)

    return render :new unless @subscription.save

    redirect_to subscriptions_path
  end

  def destroy
    Subscription.find(params[:id]).destroy
    redirect_to subscriptions_path
  end

  private

  def subscription_params
    params.require(:subscription).permit(:name, :amount, :due_day)
  end
end
