class RemoveUserIdFromMoves < ActiveRecord::Migration
  def up
    remove_column :moves, :user_id
  end

  def down
    add_column :moves, :user_id, :integer
  end
end
