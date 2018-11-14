class CreateEducationRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :education_records do |t|
      t.string :school_name
      t.string :field_of_study
      t.string :degree_level

      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
