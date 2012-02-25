class AccountsController < ApplicationController
  
  # We will restrict access to the main accounts page for 
  
  before_filter :verify_primary_account_holder, :only => [:index]
  
  before_filter :find_account, :only => [:show, :edit, :update]
  
  def index
    @accounts = Account.all
  end

  def show
  end

  def edit
  end
  
  def update
    respond_to do |format|
      if @account.update_attributes(params[:account])
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
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
