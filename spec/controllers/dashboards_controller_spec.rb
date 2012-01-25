require 'spec_helper'

describe DashboardsController do
  
  before :each do
    User.destroy_all
    @user = Factory.create(:user)
    sign_in @user
  end
  
  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

end
