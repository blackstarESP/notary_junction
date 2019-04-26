# frozen_string_literal: true
class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:edit]
	
  def index
    @users = User.all
  end

  def show
    if user_signed_in? && current_user.id == params[:id].to_i
      @user = current_user
      @authorized = true
      if @user.subscription.present?
        @plan_name = @user.subscription.plan_name
      else
        @plan_name = "Free Plan"
      end
    else
      @user = User.find_by(id: params[:id])
    end
  end

  def edit
    @user = User.find(params[:id])
  end
end
