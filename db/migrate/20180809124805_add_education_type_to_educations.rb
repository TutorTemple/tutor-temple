class AddEducationTypeToEducations < ActiveRecord::Migration[5.2]
  def change
    add_column :educations, :education_type, :integer, index: true, null: false, default: 0
  end
end
