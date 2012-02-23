class InvoicesController < ApplicationController
  
  respond_to :html
  
  before_filter :find_invoice, :only => [:show, :edit, :update, :destroy, :view]
  
  skip_before_filter :authenticate_user!, :only => [:view]
  
  def index
    @invoices = @user.invoices.page(params[:page]) 
    respond_with @invoice
  end

  def new
    @invoice = @user.invoices.new
    @invoice.line_items.build
    respond_with @invoice
  end
  
  def create
    @invoice = @user.invoices.new(params[:invoice])

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice }
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
  
  # Allows users to share invoices with clients
  def view
    @client = @user.clients.find(@invoice.client_id)
    render :layout => 'share'
  end
  
  # Send an invoice to a client
  def send_to_client
    
  end
  
  private
  
  def find_invoice 
    @invoice = @user.invoices.find(params[:id])
  end

end
