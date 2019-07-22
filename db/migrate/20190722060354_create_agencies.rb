class CreateAgencies < ActiveRecord::Migration[5.2]
  def change
    create_table :agencies do |t|
      t.string :name
      t.string :cover_image
      t.string :logo

      t.timestamps
    end
  end
end
