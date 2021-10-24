class ChangeColumnEvaluationToQuestionEvaluation3 < ActiveRecord::Migration[6.0]
  def up
    change_column :question_evaluations, :evaluation, :integer, null: false, default: false
  end
  def down
    change_column :question_evaluations, :evaluation, :integer, null: false, default: nil
  end
end
