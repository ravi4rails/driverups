class Booking < ApplicationRecord
  belongs_to :driver, optional: true
  belongs_to :user, optional: true

  geocoded_by :starting_point
  geocoded_by :end_point

after_create :assign_default_status

STATUS = ["Confirm , Pending"]
 
  def assign_default_status
    self.update(status: "Pending")
  end  
end
