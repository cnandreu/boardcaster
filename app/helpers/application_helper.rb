module ApplicationHelper
  
  def title
    base_title = "Boardcaster"
    @title.nil? ? base_title : "#{base_title} | #{@title}"
  end
  
  def navigation(page_name, path)
    content_tag :li, link_to(page_name.capitalize, path) , :class => check_active(page_name) 
  end
  
  def check_active(page_name)
   "active" if params[:action] == page_name
  end
  
end
