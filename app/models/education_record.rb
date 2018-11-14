# frozen_string_literal: true

# The EducationRecord class contains all school, degree, and fields of
# study information about system users. This table stores optional info
# that users can enter from the Education section of their user profiles.

# == Schema Information
#
# Table name: education_records
#
#  id             :bigint(8)        not null, primary key
#  school_name    :string
#  field_of_study :string
#  degree_level   :string
#  user_id        :bigint(8)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class EducationRecord < ApplicationRecord
  belongs_to :users
end
