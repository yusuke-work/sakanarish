class CreateFishNutrients < ActiveRecord::Migration[6.0]
  def change
    create_table :fish_nutrients do |t|
      t.integer :nutritional_value, null: false
      t.references :fish, null: false, foreign_key: true
      t.references :nutrient_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
