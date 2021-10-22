class Form::QuestionEvaluationCollection < Form::Base
  DEFAULT_ITEM_COUNT = 11 # 作成したい登録フォームの数を指定
  # 読み取りも書き込みもできるオブジェクトの属性を定義
  attr_accessor :question_evaluations # インスタンス変数が抱える属性

  def initialize(attributes = {})
    # スーパークラスのinitializeメソッドを呼び出すattributesは引数
    super attributes
    self.question_evaluations = DEFAULT_ITEM_COUNT.times.map { QuestionEvaluation.new } unless self.question_evaluations.present?
  end

  def question_evaluations_attributes=(attributes)
    # アンダースコアはとりあえず代入はするが、使わない変数の意味
    self.question_evaluations = attributes.map { |_, v| QuestionEvaluation.new(v)}
  end

  def seve
    # 全ての属性にseveが成功しないとロールバックさせる
    # トランザクション
    QuestionEvaluation.transaction do
      self.question_evaluations.map(&:save!)
    end
      return true
    rescue => end
      return false
  end

end
