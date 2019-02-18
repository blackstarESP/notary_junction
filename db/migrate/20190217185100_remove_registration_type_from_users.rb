class RemoveRegistrationTypeFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :registration_type
  end
end
