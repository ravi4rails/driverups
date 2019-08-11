class AddIsSubscribedToAgency < ActiveRecord::Migration[5.2]
  def change
    add_column :agencies, :is_subscribed, :boolean, default: false
  end
end
