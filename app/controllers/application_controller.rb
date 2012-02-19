class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # Only skip this for static pages
  before_filter :authenticate_user!
  
  before_filter :find_user
  
  layout :layout_by_resource
  
  private 
  
  # Used in all controllers to find the current user
  def find_user
    @user = current_user
  end
  
  def layout_by_resource
    if controller_name == 'users' && action_name == 'edit'
      "application"
    elsif devise_controller?
      "devise"
    else
      "application"
    end
  end  
end
