class AlterUsersTable < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :email, unique: true
    change_column :users, :email, :string, null: false
    change_column :users, :name, :string, null: false
  end
end
