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
#  live          :boolean
#

class Game < ActiveRecord::Base

  attr_accessible :title, :user_id_white, :user_id_black, :live

  has_many :comments
  has_many :moves
  has_many :favorites

  belongs_to :white_user,   :class_name => 'User', 
                            :foreign_key => 'user_id_white'
  belongs_to :black_user,   :class_name => 'User', 
                            :foreign_key => 'user_id_black'

  validates :user_id_white, :presence => true,
                            :numericality => true
  validates :user_id_black, :presence => true,
                            :numericality => true
  validates :title,         :presence => true,
                            :uniqueness => { :case_sensitive => false }

  validate :different_players
  validate :existence

  validates :live, :inclusion => {:in => [true, false]}

  def different_players
    errors.add(:players, "must be different") if (user_id_white == user_id_black)
  end

  def existence
    errors.add(:players, "must exist") if (User.find_by_id(user_id_white).nil? || User.find_by_id(user_id_black).nil?)
  end

  def self.search(search)  
    if search  
      find(:all, :conditions => ['title LIKE ?', "%#{search}%"])  
    else  
      find(:all)  
    end  
  end  


end
