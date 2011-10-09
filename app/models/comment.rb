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

  attr_accessible :comment_data, :user_id, :game_id

  belongs_to :player
  belongs_to :game
  
  validates :comment_data,  :presence => true
  validates :user_id,       :presence => true,
                            :numericality => true
  validates :game_id,       :presence => true,
                            :numericality => true

end