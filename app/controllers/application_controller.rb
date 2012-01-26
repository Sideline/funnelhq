class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # Only skip this for static pages
  before_filter :authenticate_user!
  
  before_filter :find_user
  
  # Used in all controllers to find the current user
  def find_user
    @user = current_user
  end
end
