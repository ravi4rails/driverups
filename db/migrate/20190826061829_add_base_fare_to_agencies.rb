class AddBaseFareToAgencies < ActiveRecord::Migration[5.2]
  def change
    add_column :agencies, :base_fare, :integer
  end
end
