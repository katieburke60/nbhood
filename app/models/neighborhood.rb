class Neighborhood < ApplicationRecord
  has_many :members
  has_many :businesses
  has_many :events, through: :businesses
end
