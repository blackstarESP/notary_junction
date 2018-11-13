# == Schema Information
#
# Table name: specializations
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Specialization, type: :model do

  # Association validations

  # Associations
  it { should have_and_belong_to_many(:users) }

end
