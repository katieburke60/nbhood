class Rating < ApplicationRecord
  belongs_to :rsvp
  belongs_to :notification
  validates :rating, presence: true, numericality: true



  def create_rating(rsvp)
    if Time.now - (12 * 60 * 60) > rsvp.event.datetime && rsvp.committed
      rating = Rating.new(rsvp_id: rsvp.id)
      notification = Notification.create(member_id: rsvp.member.id)
      rating.notification = notification
      rating.save
    end
  end
end
