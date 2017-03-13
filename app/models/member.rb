class Member < ApplicationRecord
  has_many :members_follow_businesses
  has_many :businesses, through: :members_follow_businesses
  has_many :rsvps
  has_many :events, through: :rsvps
  has_many :categories, through: :events
  belongs_to :account
  belongs_to :neighborhood


  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end
end
