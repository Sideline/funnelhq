class PagesController < ApplicationController
  
  respond_to :html
  
  skip_before_filter :authenticate_user!
  
  # Application static homepage
  def index
    @users = User.all
    respond_with(@users)
  end

end
