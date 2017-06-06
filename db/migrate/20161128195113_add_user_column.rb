class AddUserColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :canons, :user_id, :integer, null: false
  end
end
