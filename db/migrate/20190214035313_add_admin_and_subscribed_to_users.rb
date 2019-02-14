class AddAdminAndSubscribedToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :subscribed, :boolean, null: false, default: false
    add_column :users, :admin, :boolean, null: false, default: false
  end
end
