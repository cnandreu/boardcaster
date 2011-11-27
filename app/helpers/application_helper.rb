#
# @author: Carlos Andreu
# def title: Sets the base title and dynamically modifies the title on other pages
# def navigation, check_active: adds .active to the current page visited

module ApplicationHelper
  
  def title
    base_title = "Boardcaster"
    @title.nil? ? base_title : "#{base_title} | #{@title}"
  end
  
  def navigation(page_name, path)
    content_tag :li, link_to(page_name, path) , :class => check_active(page_name) 
  end
  
  def check_active(page_name)
    (!@title.nil? && (@title.include? page_name) ) ? "active" : ""
  end
  
end
