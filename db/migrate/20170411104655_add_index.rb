class AddIndex < ActiveRecord::Migration[5.0]
  def change
    add_index :group_users, [:group_id, :user_id]
  end
end
