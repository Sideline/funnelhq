class PagesController < ApplicationController
  
  respond_to :html
  
  layout 'pages'
  
  skip_before_filter :authenticate_user!
  
  # Application static homepage
  
  def index
  end

end
