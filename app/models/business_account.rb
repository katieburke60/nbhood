class BusinessAccount < ApplicationRecord
  has_one :business
  # validates :email, presence: true
  # validates :password, presence: true
  has_secure_password
end
