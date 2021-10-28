class FavoritesController < ApplicationController
  def create
    # roleがguestは登録できなくする
    # favoritesレコードにuser_idとrecipe_idが入るとお気に入りしたことになる
    # ログインユーザーでfavoriteインスタンスに入れる

    # recipe.idはお気に入りぼたんのlink_toから渡す
    # 

    # binding.pry

    favorite = current_user.favorites.build(recipe_id: params[:])
    favorite.save!
    redirect_to result_path, notice: 'お気に入り登録しました'
  end

  def destroy
    favorite = current_user.favorites.find(params[:])
    favorite.destroy!
    redirect_to result_path, notice: 'お気に入り解除しました'
  end
end
