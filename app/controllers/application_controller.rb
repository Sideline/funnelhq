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
  
  # Render the correct layout for a given action

  def layout_by_resource
    if controller_name == 'registrations' && action_name == 'new'
      'login'
    elsif controller_name == 'registrations' && action_name == 'create'
      'login'
    elsif controller_name == 'passwords' && action_name == 'new'
      'login'
    elsif controller_name == 'sessions' && action_name == 'new'
      'login'
    else
      'application'
    end
  end
end
