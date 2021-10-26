class RecipesController < ApplicationController
  def recipe
  #   # 異なるパラメータで複数回apiを叩く
  #   # 取得した全てのJSONデータを配列に投入
  #   # 各JSONデータをパースして配列に再投入
  #   # 必要なデータを配列のまま成形
  #   # 各レシピを4つずつ外部キーの連番を付けてDBに保存
    
  #   category_ids = [
  #     "11-78-523",
  #     "11-73",
  #     "11-78-472",
  #     "11-78-1498",
  #     "11-78-466",
  #     "11-78-2028",
  #     "11-71",
  #     "11-78-334",
  #     "11-78-1500",
  #     "11-78-522",
  #     "11-78-324",
  #     "11-78-323",
  #     "11-78-840",
  #     "11-78-328",
  #     "11-70-2016",
  #     "11-70-2022",
  #     "11-70-2021",
  #     "11-72-2024",
  #     "11-72-2025",
  #     "11-78-465",
  #     "11-75",
  #     "11-78-471",
  #     "11-78-469",
  #     "11-78-2029",
  #     "11-76",
  #     "11-78-2027",
  #     "11-443",
  #     "11-78-1497",
  #     "11-78-1501",
  #     "11-78-1499",
  #     "11-74",
  #     "11-78-468",
  #     "11-77",
  #     "11-78-841",
  #     "11-78-327"
  #   ]
    
  #   # APIのGETリクエスト先を指定
  #   url = 'https://app.rakuten.co.jp/services/api/Recipe/CategoryRanking/20170426?'

  #   # JSONのリクエストボディのみ配列で取り出す
  #   response_bodys = category_ids.map do |category_id|
  #                     sleep(1.5)
  #                     # httpクライアントのインスタンスを作成
  #                     http_client = HTTPClient.new

  #                     # パラメータ指定
  #                     query = {
  #                       # カテゴリid
  #                       categoryId: category_id,
  #                       # アプリid
  #                       applicationId: 1031594119620209416
  #                     }

  #                     # getリクエストでJSON取得(叩く)
  #                     response = http_client.get(url, query)
  #                     # JSONのリクエストボディのみ取り出す
  #                     response.body
  #                   end

  #   # 配列とハッシュで全てのデータを格納
  #   responses = response_bodys.map do |response_body|
  #     JSON.parse(response_body)
  #   end

    
  #   # 必要なデータのみ配列のまま成形
  #   responses = responses.map do |response|
  #     res = response["result"]
  #     res.map do |res|
  #       res.values_at("foodImageUrl", "recipeTitle", "recipeMaterial", "recipeIndication", "recipeUrl")
  #     end
  #   end

  #   # レコード削除
  #   Recipe.destroy_all

  #   # 各レシピを4つずつ外部キーの連番を付けてDBに保存
  #   fish_ids = [*1..35]
  #   responses.zip(fish_ids) do |recipe, fish_id|
  #     recipes = [
  #         {
  #           fish_id: fish_id,
  #           image_url: recipe[0][0],
  #           title: recipe[0][1],
  #           material: recipe[0][2].join(','),
  #           indication: recipe[0][3],
  #           url: recipe[0][4],
  #           created_at: Time.current,
  #           updated_at: Time.current
  #         },
  #         {
  #           fish_id: fish_id,
  #           image_url: recipe[1][0],
  #           title: recipe[1][1],
  #           material: recipe[1][2].join(','),
  #           indication: recipe[1][3],
  #           url: recipe[1][4],
  #           created_at: Time.current,
  #           updated_at: Time.current
  #         },
  #         {
  #           fish_id: fish_id,
  #           image_url: recipe[2][0],
  #           title: recipe[2][1],
  #           material: recipe[2][2].join(','),
  #           indication: recipe[2][3],
  #           url: recipe[2][4],
  #           created_at: Time.current,
  #           updated_at: Time.current
  #         },
  #         {
  #           fish_id: fish_id,
  #           image_url: recipe[3][0],
  #           title: recipe[3][1],
  #           material: recipe[3][2].join(','),
  #           indication: recipe[3][3],
  #           url: recipe[3][4],
  #           created_at: Time.current,
  #           updated_at: Time.current
  #         }
  #       ]
        
  #       Recipe.insert_all(recipes)
  #       # upsert_all
  #       # insert_all
  #   end
  # end
end
