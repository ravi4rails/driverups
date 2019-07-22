class CreateDrivers < ActiveRecord::Migration[5.2]
  def change
    create_table :drivers do |t|
      t.string :first_name
      t.string :last_name
      t.string :contact_1
      t.string :conatct_2
      t.string :city
      t.string :state
      t.string :country
      t.string :address
      t.string :id_proof
      t.string :additional_id
      t.string :profile_image

      t.timestamps
    end
  end
end
