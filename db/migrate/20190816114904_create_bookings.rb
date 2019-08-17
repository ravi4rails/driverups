class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :starting_point
      t.string :end_point

      t.timestamps
    end
  end
end
