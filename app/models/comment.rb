# 
# @author Carlos Andreu
#
# Maps to the Comments table in the database.
#
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
  
  validates :comment_data,  :presence => true,
                            :length => {:minimum => 1,
                                        :maximum => 750}
  validates :user_id,       :presence => true,
                            :numericality => true
  validates :game_id,       :presence => true,
                            :numericality => true

  validate :existence

  def existence
    errors.add(:elements, "must exist") if (User.find_by_id(user_id).nil? ||
                                            Game.find_by_id(game_id).nil?)
  end

end
