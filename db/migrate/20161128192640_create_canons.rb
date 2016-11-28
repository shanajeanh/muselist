class CreateCanons < ActiveRecord::Migration[5.0]
  def change
    create_table :canons do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_index :canons, :name,                unique: true
  end
end
