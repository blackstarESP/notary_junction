class SubscriptionsController < ApplicationController
	before_action :authenticate_user!, except: [:new, :create]
	layout "subscribe"

	def new
    #@plan = params[:plan]
    #@plan_id = params[:plan_id]
	end

  def create
    Stripe.api_key = Rails.application.credentials.stripe_secret_key
    plan_id = params[:plan_id]
    plan = Stripe::Plan.retrieve(plan_id)
    token = params[:stripeToken]

    if current_user.stripe_id?
      customer = Stripe::Customer.retrieve(current_user.stripe_id)
    else
      customer = Stripe::Customer.create(email: current_user.email, source: token)
    end

    subscription = customer.subscriptions.create(plan: plan.id)

    options = {
      stripe_id: customer.id,
      stripe_subscription_id: subscription.id,
      subscribed: true
    }

    options.merge!(
      card_last_4: params[:user][:card_last_4],
      card_exp_month: params[:user][:card_exp_month],
      card_exp_year: params[:user][:card_exp_year],
      card_type: params[:user][:card_type]
    ) if params[:user][:card_last_4]

    current_user.update(options)

    flash[:success] = "You have been successfully subscribed and your plan is now active."
    redirect_to root_path
  end

  def destroy
    customer = Stripe::Customer.retrieve(current_user.stripe_id)
    customer.subscriptions.retrieve(current_user.stripe_subscription_id).delete
    current_user.update(stripe_subscription_id: nil)
    current_user.subscribed = false

    redirect_to root_path, notice: "Your subscription has been cancelled."
  end

end
