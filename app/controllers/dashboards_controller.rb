class DashboardsController < ApplicationController
  
  respond_to :html
  
  def index
    @projects = @user.projects.all
    respond_with @projects
  end
end
