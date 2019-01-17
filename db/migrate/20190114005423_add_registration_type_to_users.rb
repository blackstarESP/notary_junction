class AddRegistrationTypeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :registration_type, :string
    add_index :users, :registration_type
  end
end
