# 
# @author: Carlos Andreu
# def gravatar_for: provides a helper for working users avatars from gravatar.com
module UsersHelper

def gravatar_for(user, options = { :d => "identicon", :size => 100 })
    gravatar_image_tag(user.email.downcase, :alt => user.username,
                                            :class => 'gravatar',
                                            :gravatar => options)
  end

end
