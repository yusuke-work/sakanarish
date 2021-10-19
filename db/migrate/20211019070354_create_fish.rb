class CreateFish < ActiveRecord::Migration[6.0]
  def change
    create_table :fish do |t|
      t.string :name, null: false
      t.string :image_url, null: false
      t.integer :rakuten_category_id, null: false

      t.timestamps
    end
  end
end
