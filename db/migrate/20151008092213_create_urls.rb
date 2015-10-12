class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :url
      t.string :shorten
      t.string :type_url
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
