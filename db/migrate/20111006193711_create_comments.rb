class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :game_id
      t.text :comment_data

      t.timestamps
    end
  end
end
