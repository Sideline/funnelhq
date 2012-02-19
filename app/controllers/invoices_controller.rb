class InvoicesController < ApplicationController
  
  respond_to :html
  
  before_filter :find_invoice, :only => [:show, :edit, :update, :destroy]
  
  def index
    @invoices = @user.invoices.all
    respond_with @invoice
  end

  def new
    @invoice = @user.invoices.new
    @invoice.line_items.build
    @clients = @user.clients.all.collect{|client| [client.name, client.id]}
    respond_with @invoice
  end
  
  def create
    @invoice = @user.invoices.new(params[:invoice])

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def show
    @client = @user.clients.find(@invoice.client_id)
    respond_with @invoice
  end
  
  def edit 
    respond_with @invoice 
  end
   
  def update
    respond_to do |format|
      if @invoice.update_attributes(params[:invoice])
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
      else
        format.html { render action: "edit" } 
      end
    end
  end
  
  def destroy
    @invoice.destroy

    respond_to do |format|
      format.html { redirect_to invoices_url }
    end
  end
  
  private
  
  def find_invoice 
    @invoice = @user.invoices.find(params[:id])
  end

end
