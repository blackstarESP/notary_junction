class CreatePhoneNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :phone_numbers do |t|
      t.string :number_for
      t.boolean :mark_as_primary
      t.integer :phone_number

      t.belongs_to :user
      t.timestamps
    end
  end
end
