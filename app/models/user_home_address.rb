# frozen_string_literal: true

# The UserHomeAddress class contains all validation and association information
# for user addresses

# == Schema Information
#
# Table name: user_home_addresses
#
#  id            :bigint(8)        not null, primary key
#  home_address  :string
#  home_unit     :string
#  home_city     :string
#  home_state    :string
#  home_zip_code :string
#  home_lat      :decimal(10, 6)
#  home_lon      :decimal(10, 6)
#

class UserHomeAddress < ApplicationRecord

end
