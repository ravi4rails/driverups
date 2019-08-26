class AddAmountStatusToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :amount, :integer
    add_column :bookings, :status, :string
  end
end
