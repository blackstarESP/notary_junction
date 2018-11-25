class CreateInsurances < ActiveRecord::Migration[5.2]
  def change
    create_table :insurances do |t|
      t.string :provider
      t.string :type
      t.decimal :amount, precision: 9, scale: 2

      t.belongs_to :user
      t.timestamps
    end
  end
end
