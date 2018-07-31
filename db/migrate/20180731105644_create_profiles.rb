class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.belongs_to :user, index:true, foreign_key:true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :phone_number
      t.text :about_me
      t.date :birthday, null: false
      t.timestamps
    end
  end
end
