# frozen_string_literal: true
class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:edit]
	
  def index
    @users = User.all
  end

  def show
    if user_signed_in?
      if current_user.subscription.present?
        @subscription = current_user.subscription
        @plan_name = @subscription.plan_name
      else
        @plan_name = "Monthly Free"
      end
    else
      @user = User.find(params[:id])
    end
  end

  def edit
    @user = User.find(params[:id])
  end
end
