require 'spec_helper'

describe User do
  
  let(:user) { Factory.create(:user) }
  
  before :each do
    
  end
  
  it "returns a full name" do
    user.full_name.should match /Donald Draper/
  end
  
  it "should have no projects when first created" do
    user.number_of_projects.should equal 0
  end
  
  it "should have no projects when first created" do
    user.number_of_projects.should equal 0
  end
  
end
