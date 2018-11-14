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

require 'rails_helper'

RSpec.describe Education, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
