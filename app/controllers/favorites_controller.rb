class FavoritesController < ApplicationController
  before_action :check_general, only: %i[create destroy]

  def create
    recipe = Recipe.find(params[:recipe_id])
    current_user.favorite(recipe)
    redirect_to result_path, notice: 'お気に入り登録しました'
  end

  def destroy
    recipe = current_user.favorites.find(params[:id]).recipe
    current_user.unfavorite(recipe)
    redirect_to result_path, notice: 'お気に入り解除しました'
  end
end
