class SubscriptionsController < ApplicationController
  def show
    @subscription = Subscription.find(params[:id])
  end

  def new
    @subscription = Subscription.new(plan_id: params[:plan_id])
  end

  def create
    @subscription = Subscription.new(params[:subscription])
    if @subscription.save_with_payment
      redirect_to @subscription
    else
      render 'new'
    end
  end
end
