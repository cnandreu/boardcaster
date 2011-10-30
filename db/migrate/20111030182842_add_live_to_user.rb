class AddLiveToUser < ActiveRecord::Migration
  def change
    add_column :users, :live, :boolean
  end
end
