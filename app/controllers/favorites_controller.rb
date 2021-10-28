class FavoritesController < ApplicationController
  def create
    # gurestなら
    if current_user.guest?
      redirect_to result_path, notice: 'ログインしてください'
    else 
      # guest以外なら
      favorite = current_user.favorites.build(recipe_id: params[:recipe_id])
      favorite.save!
      redirect_to result_path, notice: 'お気に入り登録しました'
    end

  end

  def destroy
    # binding.pry
    favorite = current_user.favorites.find_by(recipe_id: params[:id])
    favorite.destroy!
    redirect_to result_path, notice: 'お気に入り解除しました'
  end
end
