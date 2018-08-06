class AddLanguagesAndTimeZoneToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :meta, :jsonb, index: {using: :gin}
  end
end
