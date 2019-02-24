# frozen_string_literal: true
class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:edit]
	
  def index
    @users = User.all
  end

  def show
    @plan_name = if current_user.plan_name.present?
                   "the " + current_user.plan_name + " plan."
                 else
                   "the free plan. Upgrade now to unlock more market coverage and profile visiblity."
                 end
  end

  def edit
    @user = User.find(params[:id])
  end
end
