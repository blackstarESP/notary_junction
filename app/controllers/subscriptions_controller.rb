class SubscriptionsController < ApplicationController
	# before_action :authenticate_user!, except: [:new, :create]  Check for subscribed before edit
	layout "subscribe"

	def new
    if user_signed_in? and current_user.subscribed?
      flash[:warning] = "Looks like you're already subscribed! Want to change your plan? Visit your profile page to make changes."
      redirect_to root_path
    else
      @subscription = Subscription.new
      @plan = params[:plan]
      @plan_id = params[:plan_id]
    end
	end

  def create
    Stripe.api_key = Rails.application.credentials.stripe_secret_key
    plan_id = params[:plan_id]
    plan = Stripe::Plan.retrieve(plan_id)
    token = params[:stripeToken]

    customer = if current_user.subscription.present?
                Stripe::Customer.retrieve(current_user.subscription.stripe_id)
               else
                Stripe::Customer.create(email: current_user.email, source: token)
               end

    subscription = customer.subscriptions.create(plan: plan.id)

    options = {
      stripe_id: customer.id,
      stripe_subscription_id: subscription.id,
      plan_name: subscription.plan.nickname,
    }

    options.merge!(
      card_last4: params[:subscription][:card_last4],
      card_exp_month: params[:subscription][:card_exp_month],
      card_exp_year: params[:subscription][:card_exp_year],
      card_type: params[:subscription][:card_brand]
    ) if params[:subscription][:card_last4]
    
    @subscription = Subscription.create(user_id: current_user.id)
    @subscription.update(options)
    if @subscription.save
      current_user.subscribed = true
      current_user.save
      flash[:success] = "You have been successfully subscribed and your plan is now active."
      redirect_to root_path
    end
  end

  def edit
    Stripe.api_key = Rails.application.credentials.stripe_secret_key
    @subscription = current_user.subscription
    @current_plan = @subscription.plan_name
    @available_plans = Plan.select{ |plan| plan.name != @current_plan }
    @customer = Stripe::Customer.retrieve(current_user.subscription.stripe_id)
    #binding.pry
  end

  def update
    @new_plan = params[:plan]
    @stripe_subscription_id = current_user.subscription.stripe_subscription_id
    @new_plan_id = if @new_plan == "Monthly Basic"
                     Rails.application.credentials.monthly_basic
                   elsif @new_plan == "Monthly Premium"
                     Rails.application.credentials.monthly_premium
                   elsif @new_plan == "Annual Basic"
                     Rails.application.credentials.annual_basic
                   else
                     Rails.application.credentials.annual_premium
                   end
    subscription = Stripe::Subscription.retrieve(@stripe_subscription_id)
    Stripe::Subscription.update(@stripe_subscription_id,
    {
      cancel_at_period_end: false,
      items: [
        {
          id: subscription.items.data[0].id,
          plan: @new_plan_id,
        }
      ],
    }
    )
    # need to to update PG with new sub info
    binding.pry
  end
  
  # need to test this
  def destroy
    customer = Stripe::Customer.retrieve(current_user.stripe_id)
    customer.subscriptions.retrieve(current_user.stripe_subscription_id).delete
    current_user.update(stripe_subscription_id: nil)
    current_user.subscribed = false
    redirect_to root_path, notice: "Your subscription has been cancelled."
  end
end
