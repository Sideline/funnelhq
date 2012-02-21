class ProjectsController < ApplicationController
  
  respond_to :html
  
  before_filter :find_project, :only => [:edit, :update, :destroy]

  def index
    @projects = @user.projects.all
    respond_with @projects
  end

  def show
    @project = @user.projects.find(params[:id])
    @tasks = @user.tasks.where(project_title: @project.title)
    respond_with @project
  end

  def new
    @project = @user.projects.new
    respond_with @project
  end

  def edit
  end

  def create
    @project = @user.projects.new(params[:project])

    respond_to do |format|
      if @project.save
        puts "Tried to save mongo"
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
      else
        puts @project.errors.full_messages.inspect
        format.html { render action: "new" }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
    end
  end
  
  private 
  
  def find_project
    @project = @user.projects.find(params[:id])
  end
end
