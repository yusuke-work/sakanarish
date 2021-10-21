class ChangeDataNutritionalValueToFishNutrient < ActiveRecord::Migration[6.0]
  def change
    change_column :fish_nutrients, :nutritional_value, :float, null: false
  end
end
