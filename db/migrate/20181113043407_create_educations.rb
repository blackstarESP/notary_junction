class CreateEducations < ActiveRecord::Migration[5.2]
  def change
    create_table :educations do |t|
      t.string :school
      t.string :field_of_study
      t.string :degree_level
      t.timestamps
    end
  end
end
