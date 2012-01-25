require 'spec_helper'

describe "Projects" do
  
  before :each do
    User.destroy_all
    @user = Factory.create(:user)
    sign_in @user
  end
  
  describe "GET /projects" do
    it "should return a HTTP success" do
      get projects_path
      response.status.should be(200)
    end
  end
end
