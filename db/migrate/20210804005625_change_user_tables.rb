class ChangeUserTables < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :google_id, :password
    remove_column :users, :token, :string
  end
end
