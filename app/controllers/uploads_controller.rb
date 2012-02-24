class UploadsController < ApplicationController

  respond_to :html
  
  skip_before_filter :authenticate_user!, :only => [:share]
  
  before_filter :find_upload, :only => [:show, :edit, :update, :destroy]
  
  def index
    @uploads = @user.uploads.page(params[:page]) 

    respond_to do |format|
      format.html 
    end
  end

  def show
    @upload = @user.uploads.find(params[:id])
    respond_with @upload
  end

  def new
    @upload = @user.uploads.new
    respond_with @upload
  end

  def edit
  end

  def create
    @upload = @user.uploads.new(params[:upload])

    respond_to do |format|
      if @upload.save
        format.html { redirect_to @upload, notice: 'Upload was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    respond_to do |format|
      if @upload.update_attributes(params[:upload])
        format.html { redirect_to @upload, notice: 'Upload was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @upload.destroy

    respond_to do |format|
      format.html { redirect_to uploads_url }
    end
  end
  
  # Share an upload with an external user

  def share
    @user = User.find(params[:user_id])
    @upload = @user.uploads.find(params[:id])
    render :layout => 'share'
  end
  
  private 
  
  def find_upload
    @upload = @user.uploads.find(params[:id])
  end
end