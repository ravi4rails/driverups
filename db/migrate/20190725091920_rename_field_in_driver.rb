class RenameFieldInDriver < ActiveRecord::Migration[5.2]
  def change
    rename_column :drivers, :conatct_2, :contact_2
  end
end
