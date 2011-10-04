class PagesController < ApplicationController
  
  before_filter :require_login, :only => :about
  
  def home
    @title = "Home"
  end

  def contact
    @title = "Contact"
  end

  def help
    @title = "Help"
  end

  def about
    @title = "About"
  end

end
