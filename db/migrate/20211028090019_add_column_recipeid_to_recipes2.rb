class AddColumnRecipeidToRecipes2 < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :original_recipe_id, :integer, null: false

    add_index :recipes, :original_recipe_id, unique: true
  end
end
