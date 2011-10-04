module ApplicationHelper
  
  def check_active(page_name)
   return "class='active'" if params[:action] == page_name
  end
  
end
