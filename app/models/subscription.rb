class Subscription < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
