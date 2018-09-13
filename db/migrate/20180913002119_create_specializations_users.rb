class CreateSpecializationsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :specializations_users do |t|
      t.belongs_to :user, index: true
      t.belongs_to :specialization, index: true
    end
  end
end
