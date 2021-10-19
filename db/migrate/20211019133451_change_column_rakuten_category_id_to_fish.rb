class ChangeColumnRakutenCategoryIdToFish < ActiveRecord::Migration[6.0]
  def change
    change_column :fish, :rakuten_category_id, :string
  end
end
