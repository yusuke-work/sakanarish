class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :image_url, null: false
      t.string :title, null: false
      t.string :material, null: false
      t.string :indication, null: false
      t.string :url, null: false
      t.references :fish, null: false, foreign_key: true

      t.timestamps
    end
  end
end
