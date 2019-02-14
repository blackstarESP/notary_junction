class ChangeColumnNameInUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :card_last_4, :card_last4
  end
end
