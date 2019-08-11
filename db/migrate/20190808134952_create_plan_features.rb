class CreatePlanFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :plan_features do |t|
      t.references :plan, foreign_key: true
      t.references :feature, foreign_key: true

      t.timestamps
    end
  end
end
