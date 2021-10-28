class ChangeColumnLastNameFirstNameToUser < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :last_name, :name
  end
end
