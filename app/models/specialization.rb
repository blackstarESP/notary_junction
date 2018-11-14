# frozen_string_literal: true

# The Specialization class contains all the necessary information about the
# possible user specialziations available for customers to choose from

# == Schema Information
#
# Table name: specializations
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Specialization < ApplicationRecord
  has_and_belongs_to_many :users
end
