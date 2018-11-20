class CreateUserHomeAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_home_addresses do |t|
      t.string :home_address
      t.string :home_unit
      t.string :home_city
      t.string :home_state
      t.string :home_zip_code
      t.decimal :home_lat, precision: 10, scale: 6
      t.decimal :home_lon, precision: 10, scale: 6
    end
  end
end
