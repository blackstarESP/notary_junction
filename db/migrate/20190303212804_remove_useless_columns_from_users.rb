class RemoveUselessColumnsFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :stripe_id
    remove_column :users, :stripe_subscription_id
    remove_column :users, :card_last4
    remove_column :users, :card_exp_month
    remove_column :users, :card_exp_year
    remove_column :users, :card_type
    remove_column :users, :plan_name
  end
end
