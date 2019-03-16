class BackgroundCheck < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
