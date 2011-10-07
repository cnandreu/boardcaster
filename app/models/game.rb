# == Schema Information
#
# Table name: games
#
#  id            :integer         not null, primary key
#  user_id_white :integer
#  user_id_black :integer
#  title         :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Game < ActiveRecord::Base
  
  attr_accessible :title, :user_id_white, :user_id_black
  
  has_many :comments
  has_many :moves
  has_many :favorites
  
  belongs_to :white_user,   :class_name => 'User', 
                            :foreign_key => 'user_id_white'
  belongs_to :black_user,   :class_name => 'User', 
                            :foreign_key => 'user_id_black'
                                                        
  validates :user_id_white, :presence => true
  validates :user_id_black, :presence => true                          
  validates :title,         :presence => true

end

