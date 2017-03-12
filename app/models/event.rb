class Event < ApplicationRecord
  belongs_to :business
  has_many :categories
  has_many :rsvps
  has_many :members, through: :rsvps
end
