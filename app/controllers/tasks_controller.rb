class TasksController < ApplicationController
  
  respond_to :html, :json
  
  before_filter :find_task, :only => [:show, :edit, :update, :destroy, :complete_task]
  
  def index
    @tasks = @user.tasks.order_by([:project_title, :asc]).page(params[:page])
    respond_with @tasks
  end

  def show
    respond_with @task
  end

  def new
    @task = @user.tasks.new
    respond_with @task
  end

  def edit
  end

  def create
    @task = @user.tasks.new(params[:task])
    
    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_path, notice: 'Task was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :ok }
    end
  end
  
  private
  
  def find_task
    @task = @user.tasks.find(params[:id])
  end
end