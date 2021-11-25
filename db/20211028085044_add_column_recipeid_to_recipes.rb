class AddColumnRecipeidToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :rakuten_recipe_id, :integer, null: false

    add_index :recipes, :rakuten_recipe_id, unique: true
  end
end
