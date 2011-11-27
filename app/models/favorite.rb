# 
# @author Carlos Andreu
#
# Maps to the Favorite table in the database.
#
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

  attr_accessible :game_id, :user_id

  belongs_to :game
  belongs_to :user

  validates :user_id,       :presence => true,
                            :numericality => true
  validates :game_id,       :presence => true,
                            :numericality => true
                            
  validate :existence

  def existence
    errors.add(:elements, "must exist") if (User.find_by_id(user_id).nil? ||
                                            Game.find_by_id(game_id).nil?)
  end

  #User can only like once
  validates_each :user_id, :game_id  do |record, attr, value|
    if Favorite.exists?( :user_id => [record.user_id, record.game_id], 
                         :game_id => [record.user_id, record.game_id])
       record.errors.add attr, 'Duplicate like detected'
    end
  end

end
