# == Schema Information
#
# Table name: comments
#
#  id           :integer         not null, primary key
#  user_id      :integer
#  game_id      :integer
#  comment_data :text
#  created_at   :datetime
#  updated_at   :datetime
#

class Comment < ActiveRecord::Base

  attr_accessible :comment_data

  belongs_to :player
  belongs_to :game

end