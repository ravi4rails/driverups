class AddDriverIdToBookings < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookings, :driver, foreign_key: true
  end
end
