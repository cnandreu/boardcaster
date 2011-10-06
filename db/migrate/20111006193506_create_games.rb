class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :user_id_white
      t.integer :user_id_black
      t.string :title

      t.timestamps
    end
  end
end
