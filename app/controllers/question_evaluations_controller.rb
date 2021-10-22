class QuestionEvaluationsController < ApplicationController
  # skip_before_action :require_login, only: %i[index]
  def index
    # binding.pry
    @questions = Question.all
    # まずは1レコードを保存できるようにする｡
    @question_evaluation_1 = QuestionEvaluation.new(question_id: 1, nutrient_category_id: 1 )
  end
  # question_evaluationのレコードには外部キー(question_idとnutrient_category_idとuser_id)がある｡
  # user_id以外をすでに紐付けたまま登録したい｡
  # quesitonsページで診断答えて､診断ボタンを押すと､question_evaluationsコントローラに処理を飛ばす｡
end
