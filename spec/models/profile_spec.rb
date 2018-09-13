require 'rails_helper'

RSpec.describe Profile, type: :model do

  # Association validations

  # Associations
  it { should belong_to(:user) }

end
