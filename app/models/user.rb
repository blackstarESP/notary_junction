# frozen_string_literal: true

# The User class is the basic model that tracks information of all users of
#  this application

# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#  system_id              :string
#  user_type              :string
#

class User < ApplicationRecord
  before_validation :set_system_id

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  # Associations
  has_many :addresses
  has_many :phone_numbers
  has_many :educations
  has_many :insurances
  has_many :certifications
  has_one :background_check

  accepts_nested_attributes_for :addresses, :phone_numbers, :educations,
                                :insurances, :certifications, :background_check

  # Validations
  validates :first_name, presence: true, format: { with: /\A[a-zA-Z]+\z/,
                                                   message: "can only have
                                                             upper and lower
                                                             case letters."
                                                 }
  validates :last_name, presence: true, format: { with: /\A[a-zA-Z]+\z/,
                                                   message: "can only have
                                                              upper and lower
                                                              case letters."
                                                }
  validates :password, presence: true,
                       format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*\W).{6,}\z/,
                                 message: "should be stronger. Make sure your
                                           password is at least 6 characters
                                           long, contains at least 1 capital
                                           letter, 1 lower case letter, and 1
                                           special character."
                                }
  # validates :user_type, presence: true
  validates :email, email: { strict_mode: true }, confirmation: true

  private

  def set_system_id
    self.system_id = SecureRandom.hex(5).upcase
  end
end
