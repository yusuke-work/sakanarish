class RemoveColumnRecipeidToRecipes < ActiveRecord::Migration[6.0]
  def change
    remove_column :recipes, :recipe_id
    remove_column :recipes, :rakuten_recipe_id
  end
end
