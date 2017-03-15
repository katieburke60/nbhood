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

  def interests
    rsvps = []
    self.rsvps.map do |rsvp|
      rsvps << rsvp if !rsvp.committed
    end
    get_events_from_rsvps(rsvps)
  end

  def commits
    rsvps = []
    self.rsvps.map do |rsvp|
      rsvps << rsvp if rsvp.committed
    end
    get_events_from_rsvps(rsvps)
  end

  def get_events_from_rsvps(rsvps)
    events = []
    rsvps.each do |rsvp|
      events << rsvp.event
    end
    events
  end
end
