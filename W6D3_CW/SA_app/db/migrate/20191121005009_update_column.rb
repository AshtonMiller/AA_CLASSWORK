class UpdateColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :username, :text
    add_column :users, :username, :text, unique: true 
  end
end
