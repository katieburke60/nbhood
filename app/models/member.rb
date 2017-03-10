class Member < ApplicationRecord
  belongs_to :account
  has_many :rsvps
  has_many :events, through: :rsvps
  has_many :categories, through: :events
end
