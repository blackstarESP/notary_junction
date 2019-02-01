# frozen_string_literal: true
class AddressesController < ApplicationController
  def new
    @address = Address.new
  end

  def create
    @id = params[:id]
    binding.pry
    @address = Address.new(address_params)

    respond_to do |format|
      if @address.save?
        format.js
        format.html { redirect_to @address, notice: "Address was successfully created." }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
  end
end

  private

  def address_params
    params.require(:user_id).permit(:address_type, :address)
  end
end
