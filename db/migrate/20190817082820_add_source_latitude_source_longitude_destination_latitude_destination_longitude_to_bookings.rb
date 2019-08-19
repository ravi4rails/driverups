class AddSourceLatitudeSourceLongitudeDestinationLatitudeDestinationLongitudeToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :source_latitude, :float
    add_column :bookings, :source_longitude, :float
    add_column :bookings, :destination_latitude, :float
    add_column :bookings, :destination_longitude, :float
  end
end
