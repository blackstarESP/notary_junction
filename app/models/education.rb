# frozen_string_literal: true

# The Education class models educational the educational attributes
# of system users

# == Schema Information
#
# Table name: educations
#
#  id             :bigint(8)        not null, primary key
#  school         :string
#  field_of_study :string
#  degree_level   :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Education < ApplicationRecord
  belongs_to :users
end
