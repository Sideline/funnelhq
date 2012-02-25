class AccountsController < ApplicationController
  
  # We will restrict access to the main accounts page for 
  
  before_filter :verify_primary_account_holder, :only => [:index]
  
  before_filter :find_account, :only => [:show, :edit]
  
  def index
    @accounts = Account.all
  end

  def new
    
  end

  def show
    
  end

  def edit
    
  end
  
  private
  
  def find_account
    @account = Account.find(params[:id])
  end
  
  # There is only one primary account holder for an application
  
  def verify_primary_account_holder
    redirect_to dashboard_path and return
  end
  
end
