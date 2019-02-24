class AddPlanNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :plan_name, :string
  end
end
