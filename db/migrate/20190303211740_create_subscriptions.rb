class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.string :stripe_id
      t.string :stripe_subscription_id
      t.integer :card_last4
      t.integer :card_exp_month
      t.integer :card_exp_year
      t.string :card_type
      t.string :plan_name
      
      t.belongs_to :user
      t.timestamps
    end
  end
end
