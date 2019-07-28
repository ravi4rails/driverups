class AddZipcodeToDrivers < ActiveRecord::Migration[5.2]
  def change
    add_column :drivers, :zipcode, :string
  end
end
