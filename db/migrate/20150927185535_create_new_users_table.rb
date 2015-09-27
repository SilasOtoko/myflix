class CreateNewUsersTable < ActiveRecord::Migration
  def change
    create_table :new_users_tables do |t|
      t.string :username
      t.string :email
      t.string :password_digest
    end
  end
end
