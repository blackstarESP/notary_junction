# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#  system_id              :string
#  user_type              :string
#

require 'rails_helper'

RSpec.describe User, type: :model do

  # Association validations
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:user_type) }
  it { should validate_uniqueness_of(:system_id).ignoring_case_sensitivity }
  it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }

  # Associations
  it { should have_and_belong_to_many(:specializations) }

end
