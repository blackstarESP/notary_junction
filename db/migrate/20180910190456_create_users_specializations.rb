# frozen_string_literal: true

class CreateUsersSpecializations < ActiveRecord::Migration[5.2]
  def change
    create_table :users_specializations, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :specialization, index: true
    end
  end
end
