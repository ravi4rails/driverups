class AddUserIdToAgencies < ActiveRecord::Migration[5.2]
  def change
    add_reference :agencies, :user, foreign_key: true
  end
end
