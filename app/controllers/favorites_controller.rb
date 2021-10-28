class FavoritesController < ApplicationController
  def create
    # 同じレシピをお気に入りするとエラーになる｡viewで条件分岐するか
    # gurestなら
    if current_user.guest?
      redirect_to result_path, alert: 'ログインしてください'
    else 
      # guest以外なら
      favorite = current_user.favorites.build(recipe_id: params[:recipe_id])
      favorite.save!
      redirect_to result_path, notice: 'お気に入り登録しました'
    end

  end

  def destroy
    # binding.pry
    # とりあえずお気に入り登録していないレシピはエラーにならないようにした
    if current_user.favorites.find_by(recipe_id: params[:id])
      favorite = current_user.favorites.find_by(recipe_id: params[:id])
      favorite.destroy!
      redirect_to result_path, notice: 'お気に入り解除しました'
    else
      redirect_to result_path, alert: 'お気に入りしていません'
    end
  end
end
