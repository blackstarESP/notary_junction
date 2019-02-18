class SubscriptionsController < ApplicationController
	before_action :authenticate_user!, except: [:new, :create]
	layout "subscribe"

	def new
    if user_signed_in? and current_user.subscribed?
      flash[:warning] = "Looks like you're already subscribed! Want to change your plan? Visit your profile page to make changes."
      redirect_to root_path
    else
      @plan = params[:plan]
      @plan_id = params[:plan_id]
    end
	end

  def create
    Stripe.api_key = Rails.application.credentials.stripe_secret_key
    plan_id = params[:plan_id]
    plan = Stripe::Plan.retrieve(plan_id)
    token = params[:stripeToken]

    customer = if current_user.stripe_id?
                Stripe::Customer.retrieve(current_user.stripe_id)
               else
                Stripe::Customer.create(email: current_user.email, source: token)
               end

    subscription = customer.subscriptions.create(plan: plan.id)

    options = {
      stripe_id: customer.id,
      stripe_subscription_id: subscription.id,
      subscribed: true
    }

    options.merge!(
      card_last4: params[:user][:card_last4],
      card_exp_month: params[:user][:card_exp_month],
      card_exp_year: params[:user][:card_exp_year],
      card_type: params[:user][:card_brand]
    ) if params[:user][:card_last4]

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
