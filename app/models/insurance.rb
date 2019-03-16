class Insurance < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
