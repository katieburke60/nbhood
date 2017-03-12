class Event < ApplicationRecord
  has_many :event_categories
  has_many :categories, through: :event_categories
  has_many :rsvps
  has_many :members, through: :rsvps
end
