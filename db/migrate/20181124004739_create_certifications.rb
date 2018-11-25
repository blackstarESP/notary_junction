class CreateCertifications < ActiveRecord::Migration[5.2]
  def change
    create_table :certifications do |t|
      t.string :name
      t.string :description
      t.string :expiration

      t.belongs_to :user
      t.timestamps
    end
  end
end
