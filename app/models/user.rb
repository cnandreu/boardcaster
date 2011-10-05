class User < ActiveRecord::Base
  authenticates_with_sorcery!
  
  attr_accessible :username, :email, :password, :password_confirmation

  #validates_confirmation_of :password
  #validates_presence_of :password, :on => :create
  #validates_presence_of :email
  #validates_uniqueness_of :email
  #validates_presence_of :username
  #validates_uniqueness_of :username
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :username,  :presence => true,
                        :length   => { :maximum => 40 }
                    
  validates :email, :presence   => true,
                    :format     => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => { :within => 6..40 }
  
end