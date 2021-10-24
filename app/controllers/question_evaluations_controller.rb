class QuestionEvaluationsController < ApplicationController
  # skip_before_action :require_login, only: %i[index]
  def new
    # 一括保存のコレクションモデルのインスタンスを作成
    @form = Form::QuestionEvaluationCollection.new
  end
  
  def create
    @form = Form::QuestionEvaluationCollection.new({ user_attributes: current_user }.merge(question_evaluation_params))
    # binding.pry
    if @form.save
      redirect_to new_question_evaluation_path, notice: '保存しました'
    else
      flash.now[:alert] = '失敗しました'
      render :index
    end

  end

  private

  # フォームの評価値取得
  def question_evaluation_params
    # フォームからはevaluationというシンボルで受け取ってform_question_evaluation_collectionモデルのquestion_evaluations_attributes属性に入れている
    params.require(:form_question_evaluation_collection).permit(question_evaluations_attributes: [:evaluation])
    # binding.pry
  end
end
