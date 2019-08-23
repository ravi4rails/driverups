class Booking < ApplicationRecord
  belongs_to :driver, optional: true
  belongs_to :user, optional: true

  geocoded_by :starting_point
  geocoded_by :end_point

end
