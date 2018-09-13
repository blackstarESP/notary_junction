require 'rails_helper'

RSpec.describe Specialization, type: :model do

  # Association validations

  # Associations
  it { should have_and_belong_to_many(:users) }

end
