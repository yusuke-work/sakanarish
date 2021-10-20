class AddImageUrlToFish < ActiveRecord::Migration[6.0]
  def change
    add_column :fish, :image_url, :string, null: false
  end
end
