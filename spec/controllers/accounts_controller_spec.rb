require 'spec_helper'

describe AccountsController do

  before :each do
    login_user
  end
  
  describe "GET 'index'" do
    it "should redirect" do
      get :index
      response.should be_redirect
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      account = Factory.create(:account)
      get :show, :id => account.id
      response.should be_success
    end
  end
  
  describe "GET show" do
    it "assigns the requested issue as @issue" do
      account = Factory.create(:account)
      get :show, :id => account.id
      assigns(:account).should eq(account)
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      account = Factory.create(:account)
      get :edit, :id => account.id
      response.should be_success
    end
  end

end
