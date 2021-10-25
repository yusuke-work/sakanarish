class FishesController < ApplicationController
  # resultアクションは評価値から魚情報を出す+レシピを出す
  def result
    # 魚情報の取得

    # fish_nutrientsテーブルを含有量で並び替えてカロリのみ
    fish_calorie_desc = FishNutrient.where(nutrient_category_id: 1).order(nutritional_value: :desc)
    
    # カロリーの評価値で7匹の魚を取得する

    # ログインユーザーの栄養カテゴリごとに評価値を足す
    nutrient_category_evaluation = current_user.question_evaluations.group(:nutrient_category_id).sum(:evaluation)
    # => {キー(nutrient_category_id)=>バリュー(evaluation), }

    # 先程取得した栄養カテゴリによって対象の7匹のidを取得する
    fish_ids = case nutrient_category_evaluation[1]
               when 1
                fish_calorie_desc.limit(7).offset(0).map(&:fish_id)
               when 2
                fish_calorie_desc.limit(7).offset(7).map(&:fish_id)
               when 3
               fish_calorie_desc.limit(7).offset(14).map(&:fish_id)
               when 4
                fish_calorie_desc.limit(7).offset(21).map(&:fish_id)
               when 5
                fish_calorie_desc.limit(7).offset(28).map(&:fish_id)
               end

    # 栄養カテゴリごとの評価値を足して比較
    # カロリーだけ削除
    nutrient_category_evaluation.delete(1)
    
    # 評価値の最大値を取得する(複数可)
    max_v = nutrient_category_evaluation.values.max
    # キーとバリューの組み合わせを取得(最大値は複数ある可能性があるため)
    max_k_v = nutrient_category_evaluation.select{ |k, v| v == max_v }
    
    # 同じ値がある場合はランダムで一つ取得(nutrient_category_idとevaluationの組み合わせになる)
    max_k_v = max_k_v.to_a.sample
    
    # 7匹の魚栄養のレコードを取得
    fishes7 = FishNutrient.where(fish_id: fish_ids)
    
    # 取得した最大値の値と栄養カテゴリによって7匹の中から一匹のfish_idを出す
    # 最大の栄養カテゴリの魚栄養レコードを取得
    fishes7 = fishes7.where(nutrient_category_id: max_k_v[0]).order(nutritional_value: :desc)
    
    # 最大の評価値によって一匹を取得(返り値は数値fish_id)
    fish_id = case max_k_v[1]
              when 2
                fishes7[6].fish_id
              when 3
                fishes7[5].fish_id
              when 4
                fishes7[4].fish_id
              when 5
                fishes7[3].fish_id
              when 6
                fishes7[2].fish_id
              when 7
                fishes7[1].fish_id
              when max_k_v[1] > 8
                fishes7[0].fish_id
              end
    


    # 魚の栄養を出す(nutrient_category_idをキーにして各栄養をハッシュにする)
    # 対象の魚に絞って全てのカラムのレコードを取得
    @fish_nutrients = Fish.joins(:fish_nutrients).select("fish.*, fish_nutrients.*").where(id: fish_id)

    # レーダーチャートの各栄養値
    @data_values = @fish_nutrients.map(&:nutritional_value)
    # binding.pry
    # @data_values = @fish_nutrients.delete(0)

    # 魚の名前を出す
    # @fish_name = [] << @fish_nutrients.first.name
    @fish_name = @fish_nutrients.first.name

    # レーダーチャートのラベル
    @data_keys = [
      'カロリー',
      'タンパク質',
      '脂質',
      '炭水化物',
      'カルシウム',
      '亜鉛',
      'ビタミンA',
      'ビタミンD',
      'ビタミンE',
      'ビタミンB12',
      'EPA・DHA'
    ]
    # binding.pry

  end
end
