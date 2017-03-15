class Notification < ApplicationRecord
  has_one :rating
  belongs_to :member

end
