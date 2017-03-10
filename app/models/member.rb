class Member < ApplicationRecord
  has_many :rsvps
  has_many :events, through: :rsvps
  has_many :categories, through: :events

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end
end
