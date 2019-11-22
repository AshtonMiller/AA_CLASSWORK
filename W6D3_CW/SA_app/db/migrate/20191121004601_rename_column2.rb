class RenameColumn2 < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :username, :username2
  end
end
