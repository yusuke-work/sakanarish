class RemoveImageUrlFromFishes < ActiveRecord::Migration[6.0]
  def change
    remove_column :fish, :image_url, :string
  end
end
