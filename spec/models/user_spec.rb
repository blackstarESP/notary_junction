require 'rails_helper'

RSpec.describe User, type: :model do

  # Association validations
  it { should validate_presence_of(:first_name) }
  it { should validate_length_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_length_of(:last_name) }
  it { should validate_length_of(:company_name) }
  it { should validate_length_of(:home_phone) }
  it { should validate_length_of(:work_phone) }
  it { should validate_length_of(:mobile_phone) }
  it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
  it { should validate_confirmation_of(:password) }

  # Associations
  it { should have_and_belong_to_many(:specializations) }
  it { should have_one(:profile) }

end
