class ChangeColumnEvaluationToQuestionEvaluation3 < ActiveRecord::Migration[6.0]
  def change
    change_column :question_evaluations, :evaluation, :integer, null: false, default: nil
  end
end
