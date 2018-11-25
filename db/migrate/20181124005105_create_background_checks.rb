class CreateBackgroundChecks < ActiveRecord::Migration[5.2]
  def change
    create_table :background_checks do |t|
      t.string :provider
      t.string :description
      t.string :expiration

      t.belongs_to :user
      t.timestamps
    end
  end
end
