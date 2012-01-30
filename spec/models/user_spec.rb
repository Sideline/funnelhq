require 'spec_helper'

describe User do
   
  before :each do
    @user = Factory.create(:user)  
  end
  
  it "returns a full name" do
    @user.full_name.should match /Donald Draper/
  end
  
end
