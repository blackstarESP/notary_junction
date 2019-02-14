class ChangeBooleanDefaultsInUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :subscribed
    remove_column :users, :admin
  end
end
