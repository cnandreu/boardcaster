class RemoveLiveFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :live    
  end

  def down
    add_column :users, :live
  end
end
