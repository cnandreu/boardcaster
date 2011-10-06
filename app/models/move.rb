# == Schema Information
#
# Table name: moves
#
#  id         :integer         not null, primary key
#  game_id    :integer
#  user_id    :integer
#  move_data  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Move < ActiveRecord::Base
  
  attr_accessible :move_data
  
  belongs_to :player
  belongs_to :game

end


