class ChangeUsersTableName < ActiveRecord::Migration
  def change
    rename_table :new_users_tables, :users
  end
end
