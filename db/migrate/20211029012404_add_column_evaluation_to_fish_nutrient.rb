class AddColumnEvaluationToFishNutrient < ActiveRecord::Migration[6.0]
  def change
    add_column :fish_nutrients, :evaluation, :integer, null: false
  end
end
