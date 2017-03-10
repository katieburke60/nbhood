class Account < ApplicationRecord
  has_one :member
  validates :email, presence: true
  validates :password, presence: true
  has_secure_password
end
