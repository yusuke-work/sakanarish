class ChangeColumnEvaluationToQuestionEvaluation < ActiveRecord::Migration[6.0]
  def change
    change_column :question_evaluations, :evaluation, :integer, null: false, default: 3
  end
end
