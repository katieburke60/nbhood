class Rsvp < ApplicationRecord
  belongs_to :event
  belongs_to :member
  has_one :rating
  delegate :start_time, to: :event
end
