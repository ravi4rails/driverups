class AddFirstNameLastNameContactNumberCityStateCountryAddressIdProofToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :contact_number, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :country, :string
    add_column :users, :address, :string
    add_column :users, :id_proof, :string
  end
end
