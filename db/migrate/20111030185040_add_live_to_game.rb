class AddLiveToGame < ActiveRecord::Migration
  def change
    add_column :games, :live, :boolean
  end
end
