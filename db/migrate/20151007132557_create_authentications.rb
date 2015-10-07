class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.string :uid
      t.string :provider
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_index :authentications, [:uid, :provider, :user_id], :unique => true
  end
end
