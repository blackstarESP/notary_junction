class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :company_address
      t.string :company_city
      t.string :company_state
      t.string :company_email
      t.string :company_website
      t.integer :company_zip_code
      t.integer :company_phone_number
      t.integer :company_fax_number

      t.timestamps null: false

      t.index :company_zip_code
    end
  end
end
