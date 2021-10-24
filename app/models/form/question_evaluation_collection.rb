class Form::QuestionEvaluationCollection < Form::Base
  DEFAULT_ITEM_COUNT = 13 # 作成したい登録フォームの数を指定
  # インスタンスが抱える属性を定義
  attr_accessor :question_evaluations, :user

  def initialize(attributes = {})
    # スーパークラスのinitializeメソッドを呼び出す?
    super attributes
    # question_evaluationsという変数に一つの配列を入れている｡各要素はレコード
    # 中身は空のレコードが13個
    self.question_evaluations = DEFAULT_ITEM_COUNT.times.map { QuestionEvaluation.new() } unless self.question_evaluations.present?
    # 配列の値を変更(self.question_evaluations[配列要素番号][:キー名] = 〇〇)
    self.question_evaluations[0][:question_id] = 1
    self.question_evaluations[0][:nutrient_category_id] = 1

    self.question_evaluations[1][:question_id] = 2
    self.question_evaluations[1][:nutrient_category_id] = 6

    self.question_evaluations[2][:question_id] = 3
    self.question_evaluations[2][:nutrient_category_id] = 6

    self.question_evaluations[3][:question_id] = 4
    self.question_evaluations[3][:nutrient_category_id] = 7

    self.question_evaluations[4][:question_id] = 5
    self.question_evaluations[4][:nutrient_category_id] = 7

    self.question_evaluations[5][:question_id] = 6
    self.question_evaluations[5][:nutrient_category_id] = 8

    self.question_evaluations[6][:question_id] = 7
    self.question_evaluations[6][:nutrient_category_id] = 8

    self.question_evaluations[7][:question_id] = 8
    self.question_evaluations[7][:nutrient_category_id] = 9

    self.question_evaluations[8][:question_id] = 9
    self.question_evaluations[8][:nutrient_category_id] = 9

    self.question_evaluations[9][:question_id] = 10
    self.question_evaluations[9][:nutrient_category_id] = 10

    self.question_evaluations[10][:question_id] = 11
    self.question_evaluations[10][:nutrient_category_id] = 10

    self.question_evaluations[11][:question_id] = 12
    self.question_evaluations[11][:nutrient_category_id] = 11

    self.question_evaluations[12][:question_id] = 13
    self.question_evaluations[12][:nutrient_category_id] = 11
    # binding.pry
  end
    
  def user_attributes=(attributes)
    # userにcurrent_user情報が入る
    # binding.pry
    self.user = attributes
  end

  def question_evaluations_attributes=(attributes)
    # アンダースコアはとりあえず代入はするが、使わない変数の意味
    # user_idにはuser属性のidをセット
    # nutrient_category_idとquestion_idはセットできていない どのタイミングでそれぞれセットするか
    self.question_evaluations = attributes.map { |_, v| QuestionEvaluation.new(v.merge(user_id: user.id))}
  end

  def save
    # 全ての属性にseveが成功しないとロールバックさせる
    QuestionEvaluation.transaction do
      self.question_evaluations.map(&:save!)
    end
      return true
    rescue => e
      return false
  end

end
