class AddDistanceToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :distance, :float
  end
end
