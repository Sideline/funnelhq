class DashboardsController < ApplicationController
  
  # 
  def index
    @projects = @user.projects.all
  end

end
