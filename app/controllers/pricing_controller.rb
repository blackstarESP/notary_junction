# frozen_string_literal: true
class PricingController < ApplicationController

	def index
    if user_signed_in? && current_user.subscribed?
      flash[:success] = "Looks like you're already a customer. If you want to change your plan, you can do so in your user profile."
      redirect_to root_path
    end
	end
  
end
