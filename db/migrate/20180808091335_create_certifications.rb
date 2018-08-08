class CreateCertifications < ActiveRecord::Migration[5.2]
  def change
    create_table :certifications do |t|
      t.belongs_to :profile, foreign_key: true
      t.string :name, index: true, null: false
      t.string :institution, index: true, null: false
      t.string :attachment
      t.date :termination_date, index: true

      t.timestamps
    end
  end
end
