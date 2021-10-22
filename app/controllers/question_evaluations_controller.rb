class QuestionEvaluationsController < ApplicationController
  # skip_before_action :require_login, only: %i[index]
  # newアクションに移動させるか
  def index
    # まずは1レコードを保存できるようにする｡
    @question_evaluation_1 = QuestionEvaluation.new
    # binding.pry
  end
  
  def create
    # 外部キーセット(strong_parameter)
    @question_evaluation_1 = QuestionEvaluation.new(question_evaluation_params)
    # binding.pry

    if @question_evaluation_1.save
      redirect_to question_evaluations_path, notice: '保存しました'
    else
      flash.now[:alert] = '失敗しました'
      render :index
    end

  end
  # question_evaluationのレコードには外部キー(question_idとnutrient_category_idとuser_id)がある｡
  # user_id以外をすでに紐付けたまま登録したい｡
  # quesitonsページで診断答えて､診断ボタンを押すと､question_evaluationsコントローラに処理を飛ばす｡
  private

  def question_evaluation_params
    # binding.pry
    params.require(:question_evaluation).permit(:evaluation).merge(question_id: 1, nutrient_category_id: 1, user_id: current_user.id)
  end
end
