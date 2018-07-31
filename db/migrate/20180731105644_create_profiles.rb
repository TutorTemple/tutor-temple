class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.belongs_to :user, index:true, foreign_key:true
      t.string :first_name, index: true, null: false
      t.string :last_name, index: true, null: false
      t.integer :gender, index: true, null: false
      t.string :phone_number, index: true
      t.text :about_me
      t.date :birthday, index: true, null: false
      t.timestamps
    end
  end
end
