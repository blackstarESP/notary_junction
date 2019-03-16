class Certification < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
