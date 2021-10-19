class CreateNutrientCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :nutrient_categories do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
