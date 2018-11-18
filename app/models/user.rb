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
                       format: { with: /\A(?=.*[a-zA-Z])
                                          (?=.*[0-9])
                                          (?=.*[!@#$%^&*()]).{6,}+\z/,
                                 message: "should be stronger. Make sure your
                                           password is at least 6 characters
                                           long, contains a capital letter,
                                           a lower case letter, and a special
                                           character."
                                }
  # validates :user_type, presence: true
  validates :email, email: { strict_mode: true }
  validates :system_id, uniqueness: true, length: { is: 10 }

  private

  def set_system_id
    self.system_id = SecureRandom.hex(5).upcase
  end
end
