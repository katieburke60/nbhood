class Event < ApplicationRecord
  belongs_to :business
  has_many :event_categories
  has_many :categories, through: :event_categories
  has_many :rsvps
  has_many :members, through: :rsvps
  delegate :neighborhood, to: :business

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
    if self.datetime < Time.now
      self.active = false
      self.save
    end
  end

  def start_time
    self.datetime ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end
end
