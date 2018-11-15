# frozen_string_literal: true

# The Company class defines all the necessary information pertaining to
#  the companies users work for or own. Their primary place of business or
#  an employer.

# == Schema Information
#
# Table name: companies
#
#  id                   :bigint(8)        not null, primary key
#  company_name         :string
#  company_address      :string
#  company_city         :string
#  company_state        :string
#  company_email        :string
#  company_website      :string
#  company_zip_code     :integer
#  company_phone_number :integer
#  company_fax_number   :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Company < ApplicationRecord
  has_many :users
end
