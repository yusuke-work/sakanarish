class QuestionEvaluationsController < ApplicationController
  def new
    # 一括保存のコレクションモデルのインスタンスを作成(initializeメソッドが動く)
    @form = Form::QuestionEvaluationCollection.new
  end
  
  def create
    # user_attributesはコレクションモデルの属性｡ログインuser情報をセット
    @form = Form::QuestionEvaluationCollection.new({ user_attributes: current_user }.merge(question_evaluation_params))
    if @form.save
      redirect_to result_path, notice: '保存しました'
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
  end
end
