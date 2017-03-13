class Business < ApplicationRecord
  has_many :events
  has_many :members_follow_businesses
  has_many :members, through: :members_follow_businesses
  belongs_to :business_account
end
