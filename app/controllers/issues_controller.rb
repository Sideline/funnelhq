class IssuesController < ApplicationController
  
  respond_to :html
  
  before_filter :find_issue, :only => [:edit, :update, :destroy]

  def index
    @issues = @user.issues.page(params[:page]) 
    respond_with @issues
  end

  def show
    @issue = @user.issues.find(params[:id])
    respond_with @issue
  end

  def new
    @issue = @user.issues.new
    respond_with @issue
  end

  def edit
  end

  def create
    @issue = @user.issues.new(params[:issue])

    respond_to do |format|
      if @issue.save
        format.html { redirect_to @issue, notice: 'Issue was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    respond_to do |format|
      if @issue.update_attributes(params[:issue])
        format.html { redirect_to @issue, notice: 'Issue was successfully updated.' }
      else
        format.html { render action: "edit" } 
      end
    end
  end

  def destroy
    @issue.destroy

    respond_to do |format|
      format.html { redirect_to issues_url }
    end
  end
  
  private
  
  def find_issue
    @issue = @user.issues.find(params[:id])
  end
end