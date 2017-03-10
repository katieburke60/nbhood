class Event < ApplicationRecord
  has_many :categories
  has_many :rsvps
  has_many :members, through: :rsvps
end
