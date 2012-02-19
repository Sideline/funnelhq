class InvoicesController < ApplicationController
  
  def index
    @invoices = @user.invoices.all
  end

  def new
    @invoice = @user.invoices.new
    @clients = @user.clients.all.collect{|client| [client.name, client.id]}
  end

  def edit
  end

  def show
  end

end
