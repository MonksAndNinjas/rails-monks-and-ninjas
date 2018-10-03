class SubscriptionsController < ApplicationController
  def index
    @subscriptions = @current_user.subscriptions
  end

  def new
    @subscription = @current_user.subscriptions.build
  end

  def create
    @subscription = @current_user.subscriptions.build(subscription_params)

    if @subscription.save
      redirect_to subscriptions_path
    else
      render :new
    end
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
