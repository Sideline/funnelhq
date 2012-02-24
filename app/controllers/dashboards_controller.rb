class DashboardsController < ApplicationController
  
  respond_to :html
  
  # There is a lot of querying here that might be pretty slow. 
  
  def index
    @projects = @user.projects
    feed_candidates = @projects | @user.tasks | @user.issues
    @feed_items = feed_candidates.sort_by(&:created_at).reverse.first(3)
    respond_with @projects, @feed_items
  end
end
