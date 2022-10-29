class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :varchar, null: false
    add_column :users, :password_digest, :varchar, null: false
    add_column :users, :role, :integer, null: false
  end
end
