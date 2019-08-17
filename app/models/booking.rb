class Booking < ApplicationRecord
  belongs_to :driver, optional: true
  belongs_to :user, optional: true
end
