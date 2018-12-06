class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :address_type
      t.string :unit_number
      t.string :street_name
      t.string :unit_id
      t.string :city
      t.string :state
      t.string :zip_code
      t.decimal :lat, precision: 10, scale: 7
      t.decimal :lon, precision: 11, scale: 7

      t.belongs_to :user
      t.timestamps
    end
  end
end
