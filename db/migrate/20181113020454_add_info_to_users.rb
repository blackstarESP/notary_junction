class AddInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :system_id, :string
    add_column :users, :user_type, :string

    add_index :users, :system_id, unique: true
  end
end
