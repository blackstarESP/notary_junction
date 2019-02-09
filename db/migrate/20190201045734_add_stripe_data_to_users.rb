class AddStripeDataToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :stripe_id, :string
    add_column :users, :stripe_subscription_id, :string
    add_column :users, :card_last_4, :integer
    add_column :users, :card_exp_month, :integer
    add_column :users, :card_exp_year, :integer
    add_column :users, :admin, :boolean
    add_column :users, :subscribed, :boolean
    add_column :users, :card_type, :string
  end
end
