class FavoritesController < ApplicationController
  def create
    # favoritesレコードにuser_idとrecipe_idが入るとお気に入りしたことになる
    # ログインユーザーでfavoriteインスタンスに入れる
    # current_user
  end

  def destroy
  end
end
