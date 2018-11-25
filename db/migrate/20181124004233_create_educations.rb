class CreateEducations < ActiveRecord::Migration[5.2]
  def change
    create_table :educations do |t|
      t.string :school
      t.string :level
      t.string :field
      t.string :gpa
      t.integer :year_graduated

      t.belongs_to :user
      t.timestamps
    end
  end
end
