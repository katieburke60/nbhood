class Rsvp < ApplicationRecord
  belongs_to :event
  belongs_to :member
  delegate :start_time, to: :event
end
