class FavoritesController < ApplicationController
  def create
    # favoritesレコードにuser_idとrecipe_idが入るとお気に入りしたことになる
    # ログインユーザーでfavoriteインスタンスに入れる
  end

  def destroy
  end
end
