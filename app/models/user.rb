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
#  company_id             :bigint(8)
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  validates :first_name, :last_name, :user_type, presence: true
  validates :email, email: { strict_mode: true },
                    uniqueness: { case_sensitive: false }
  validates :system_id, uniqueness: { case_sensitive: false },
                        length: { is: 10 }

  has_and_belongs_to_many :specializations
  has_many :education_records, dependent: :destroy
  belongs_to :company
end
