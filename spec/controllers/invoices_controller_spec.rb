require 'spec_helper'

describe InvoicesController do
  
  before :each do
    login_user
  end
  
  def valid_attributes
    { }
  end
  
  describe "GET 'index'" do
    it "returns http success" do
      get :index
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get :new
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      invoice = @user.invoices.create! valid_attributes
      get :edit, :id => invoice.id
      assigns(:invoice).should eq(invoice)
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
    end
  end

end
