class CreateQuestionEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :question_evaluations do |t|
      t.integer :evaluation, null: false
      t.references :question, null: false, foreign_key: true
      t.references :nutrient_category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
