class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true

      # user_idとrecipe_idの重複を防ぐ｡
      t.index [:user_id, :board_id], unique: true
      t.timestamps
    end
  end
end
