class Education < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
