class CreateWorkExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :work_experiences do |t|
      t.belongs_to :profile, foreign_key: true
      t.string :company_name, index: true, null: false
      t.string :title, index: true, null: false
      t.string :location, index: true, null: false
      t.date :start_date
      t.date :end_date
      t.boolean :current_workplace

      t.timestamps
    end
  end
end
