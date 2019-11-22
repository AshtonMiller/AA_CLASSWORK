class DeleteColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :email, :text
  end
end
