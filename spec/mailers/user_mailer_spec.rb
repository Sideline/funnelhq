require "spec_helper"

describe UserMailer do
  
  let(:user) { Factory.create(:user) }
  
  describe "test_email" do
    it "should render successfully" do
      lambda { UserMailer.test_email(user) }.should_not raise_error
    end
  end
  
end
