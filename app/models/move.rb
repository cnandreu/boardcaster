# 
# @author Carlos Andreu
#
# Maps to the Moves table in the database.
#
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
  
  belongs_to :game

  fen_regex = /[\w]+\/[\w]+\/[\w]+\/[\w]+\/[\w]+\/[\w]+\/[\w]+\/[\w]+\s.\s[\w]+\s[\w|-]+\s[\w]\s[\w]+/i

  #validates :move_data, :presence => true,
  #                      :length => {:maximum => 255,
  #                                  :minimum => 28 },
  #                      :format => { :with => fen_regex }
 

  validates :move_data,     :presence => true


  validates :game_id,       :presence => true,
                            :numericality => true

  validate :existence
    
  validate :repetition

  def existence
    errors.add(:game, "must exist") if Game.find_by_id(game_id).nil? 
  end

  def repetition
    errors.add(:game, "repetition fail") if (Move.all.count > 0 and move_data == Move.last.move_data)
  end

end


