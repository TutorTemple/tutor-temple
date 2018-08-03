class CreateUserAuthentications < ActiveRecord::Migration[5.2]
  def change
    create_table :user_authentications do |t|
      t.references :user, foreign_key: true
      t.references :authentication_provider, foreign_key: true
      t.string   :uid
      t.string   :token
      t.datetime :token_expires_at
      t.text     :params

      t.timestamps
    end
  end
end
