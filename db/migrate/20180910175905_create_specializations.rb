# frozen_string_literal: true

class CreateSpecializations < ActiveRecord::Migration[5.2]
  def change
    create_table :specializations do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.timestamps
    end
  end
end
