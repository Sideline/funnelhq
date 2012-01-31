class DashboardsController < ApplicationController
  
  respond_to :html
  
  def index
    @projects = @user.projects.recent
    respond_with @projects
  end
end
