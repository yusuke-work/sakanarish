class FishNutrientsController < ApplicationController
  before_action :check_general, only: %i[favorites]

  def calculation
    # <カロリーの評価値で7匹の魚を取得する>
    # fish_nutrientsテーブルをカロリの含有量で並び替え
    # fish_nutrients = FishNutrient.all
    fish_calorie_desc = FishNutrient.where(nutrient_category_id: 1).order(nutritional_value: :desc)

    # ログインユーザーの各栄養素カテゴリと評価値
    # binding.pry
    nutrient_category_evaluation = current_user.question_evaluations.group(:nutrient_category_id).sum(:evaluation)
    # => {キー(nutrient_category_id)=>バリュー(evaluation), }

    # カテゴリがカロリーのバリューによって7匹のidを出す
    fish_7ids = case nutrient_category_evaluation[1]
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


    # binding.pry
    # <他の栄養カテゴリの評価値によって魚を一匹出す>
    # どのカテゴリの評価値が一番大きいか,足して比較
    # カロリーだけ削除
    nutrient_category_evaluation.delete(1)
    # 評価値の最大値を取得する(複数可)
    # binding.pry
    max_v = nutrient_category_evaluation.values.max
    
    # キーとバリューの組み合わせを取得(最大値は複数ある可能性があるため)
    max_k_v = nutrient_category_evaluation.select{ |k, v| v == max_v }

    # result画面に渡すため
    session[:max_nutrient_category] = max_k_v

    # 同じ値がある場合はランダムで一つ取得(nutrient_category_idとevaluationの組み合わせになる)
    max_k_v_rum = max_k_v.to_a.sample

    # <取得した最大値の値と栄養カテゴリによって7匹の中から一匹のfish_idを出す>
    # 7匹の魚栄養のレコードを取得
    # 最大の栄養カテゴリの魚栄養レコードを取得
    fishes7 = FishNutrient.where(fish_id: fish_7ids).where(nutrient_category_id: max_k_v_rum[0]).order(nutritional_value: :desc)

    # 最大の評価値によって一匹を取得
    session[:fish_id] = case max_k_v_rum[1]
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
              else 
                fishes7[0].fish_id
              end
              # binding.pry
    # ish_idと最大の栄養カテゴリ(hash)を渡す
    # redirect_to result_path(fish_id: fish_id, max_nutrient_category: max_k_v)
    redirect_to result_path
  end

  def result
    # <診断結果の魚と名前>
    # 対象の魚の栄養と評価値の集合
    fish_select_nutrients = Fish.joins(:fish_nutrients).select("fish.*, fish_nutrients.nutritional_value, fish_nutrients.evaluation").where(id: session[:fish_id] )
    # 対象の魚一匹
    @fish = fish_select_nutrients.first

    # <メッセージ>
    # binding.pry
    @max_nutrient_categories = session[:max_nutrient_category]

    # <栄養表>
    @fish_nutrients = fish_select_nutrients.map(&:nutritional_value)

    #<レーダーチャート用 >
    # 各栄養の評価値
    @data_values = fish_select_nutrients.map(&:evaluation)

    # ラベル
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
    # <レシピ用>
    # binding.pry
    @recipes = @fish.recipes
  end

  # お気に入りしたレシピ一覧
  def favorites
    # binding.pry
    @favorite_recipes = current_user.recipes
  end
end
