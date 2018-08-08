class CreateEducations < ActiveRecord::Migration[5.2]
  def change
    create_table :educations do |t|
      t.belongs_to :profile, foreign_key: true
      t.string :degree, index: true, null: false
      t.string :institution, index: true, null: false
      t.string :graduating_year, index: true, null: false

      t.timestamps
    end
  end
end
