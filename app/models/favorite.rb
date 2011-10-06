# == Schema Information
#
# Table name: favorites
#
#  id         :integer         not null, primary key
#  game_id    :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Favorite < ActiveRecord::Base

  belongs_to :game
  belongs_to :user

end

