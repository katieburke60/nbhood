class Event < ApplicationRecord
  belongs_to :business
  has_many :event_categories, dependent: :destroy
  has_many :categories, through: :event_categories
  has_many :rsvps, dependent: :destroy
  has_many :members, through: :rsvps
  delegate :neighborhood, to: :business
  has_many :ratings, through: :rsvps

  validates :name, presence: true, length: { maximum: 50 }
  validates :datetime, presence: true
  validates :price, numericality: true, length: { maximum: 4 }
  validates :price_description, presence: true, length: { maximum: 255 }
  validates :capacity, presence: true, numericality: true, length: { maximum: 1000 }


  def check_capacity
    if rsvps.count >= capacity
      self.active = false
      self.save
    else
      self.active = true
      self.save
    end
  end

  def check_end_date
    if self.datetime < Time.now.to_time
      self.active = false
      self.save
    end
  end

  def prompt_ratings
    if self.datetime < Time.now - 12*60*60 && self.ratings.empty?
      self.rsvps.each do |rsvp|
        create_rating(rsvp)
      end
    end
  end


  def start_time
    self.datetime ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end
end
