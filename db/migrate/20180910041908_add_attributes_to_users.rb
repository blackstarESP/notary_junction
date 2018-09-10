# frozen_string_literal: true

class AddAttributesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :company_name, :string
    add_column :users, :home_phone, :string
    add_column :users, :work_phone, :string
    add_column :users, :mobile_phone, :string
    add_column :users, :website_url, :string
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip_code, :string
    add_column :users, :system_id, :string

    add_index :users, :zip_code
    add_index :users, :system_id, unique: true
  end
end
