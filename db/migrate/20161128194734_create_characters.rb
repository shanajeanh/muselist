class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.string :name, null: false
      t.string :journal_url, null: false
      t.string :icon_url
      t.string :blurb
      t.belongs_to :canon, null: false
      t.belongs_to :user, null: false

      t.timestamps
    end
  end
end
