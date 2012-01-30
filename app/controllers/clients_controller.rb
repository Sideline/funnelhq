class ClientsController < ApplicationController
  
  respond_to :html
  
  before_filter :find_client, :only => [:show, :edit, :update, :destroy]
  
  def index
    @clients = Client.all
    respond_with @clients
  end

  def show
    respond_with @client
  end

  def new
    @client = Client.new
    respond_with @client
  end

  def edit
  end

  def create
    @client = Client.new(params[:client])

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    respond_to do |format|
      if @client.update_attributes(params[:client])
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @client.destroy

    respond_to do |format|
      format.html { redirect_to clients_url }
    end
  end
  
  private 
  
  def find_client
    @client = Client.find(params[:id])
  end
end
