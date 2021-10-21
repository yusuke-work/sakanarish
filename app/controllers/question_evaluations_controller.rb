class QuestionEvaluationsController < ApplicationController
  # skip_before_action :require_login, only: %i[index]
  def index
    # binding.pry
    @questions = Question.all

    @question_evaluation = QuestionEvaluation.new
  end
  # quesitonsページで診断答えて､診断ボタンを押すと､question_evaluationsコントローラに処理を飛ばす｡
end
