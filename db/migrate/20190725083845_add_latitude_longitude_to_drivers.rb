class AddLatitudeLongitudeToDrivers < ActiveRecord::Migration[5.2]
  def change
    add_column :drivers, :latitude, :float
    add_column :drivers, :longitude, :float
  end
end
