class AddressesController < ApplicationController

  def create
    Address.create(create_address_params)
  end

  private

  def create_address_params
    params.permit(:user_id)
  end

end
