class AddColumnRecipeIdToRecipes < ActiveRecord::Migration[6.0]
  def change
    remove_column :recipes, :recipe_id
  end
end
