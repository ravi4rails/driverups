class ChangeDataTypeForDistance < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :distance, :string
  end
end
