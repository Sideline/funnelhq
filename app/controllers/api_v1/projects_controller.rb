class ApiV1::ProjectsController < ApiV1::BaseController
  
  respond_to :json, :xml
  
  #
  # GET /api_v1/:key/projects.(:format)
  
  def index
    respond_with( @api_user.projects )
  end

  def show
    respond_with( @api_user.projects.find(params[:id]) )
  end

  private 

  def find_project
    @project = Project.for(current_user).find(params[:id])
    rescue Mongoid::Errors::DocumentNotFound
      error = { :error => "The project you were looking for could not be found." }
      respond_with(error, :status => 404)
  end
end