class RenameColumnInPlans < ActiveRecord::Migration[5.2]
  def change
    rename_column :plans, :plan_name, :name
  end
end
