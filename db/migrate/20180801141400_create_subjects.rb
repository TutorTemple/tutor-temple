class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.string :name, index: true, null: false, unique: true

      t.timestamps
    end

    create_table :profile_subjects, id: false do |t|
      t.belongs_to :profile, index: true, foreign_key: true
      t.belongs_to :subject, index: true, foreign_key: true
    end
  end
end
