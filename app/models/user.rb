# == Schema Information
#
# Table name: users
#
#  id                           :integer         not null, primary key
#  username                     :string(255)     not null
#  email                        :string(255)
#  crypted_password             :string(255)
#  salt                         :string(255)
#  created_at                   :datetime
#  updated_at                   :datetime
#  remember_me_token            :string(255)
#  remember_me_token_expires_at :datetime
#

class User < ActiveRecord::Base
  authenticates_with_sorcery!
  
  attr_accessible :username, :email, :password, :password_confirmation
  
  has_many :games_white,  :class_name => 'Game', 
                          :foreign_key => 'user_id_white'
  has_many :games_black,  :class_name => 'Game', 
                          :foreign_key => 'user_id_black'
  has_many :comments
  has_many :moves
  has_many :favorites
  
  
  def games_all
       games_white + games_black
  end
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :username,  :presence => true,
                        :length   => { :maximum => 40 },
                        :uniqueness => { :case_sensitive => false }
                    
  validates :email, :presence   => true,
                    :length     => { :maximum => 255 },
                    :format     => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => { :within => 6..40 }

end


