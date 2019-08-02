class AddAdditionalProofToDrivers < ActiveRecord::Migration[5.2]
  def change
    add_column :drivers, :additional_proof, :string
  end
end
