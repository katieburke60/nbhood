class Event < ApplicationRecord
  has_many :categories
  has_many :rsvps
  has_many :members, through: :rsvps

  def check_capacity
    if rsvps.count >= capacity
      self.active = false
    else
      self.active = true
    end
  end

  def start_time
    self.datetime ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end
end
