module ApplicationHelper
  
  def check_active(page_name)
   return "class='active'" if params[:action] == page_name
  end
  
  def title
    base_title = "Boardcaster"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
end
