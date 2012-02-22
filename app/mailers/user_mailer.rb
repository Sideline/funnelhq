class UserMailer < ActionMailer::Base
  
  default :from => "support@funnelhq.com"

  def test_email(user)
    @user = user
    @url  = "http://www.funnelhq.com"
    mail(:to => user.email, :subject => "This is a test email")
  end
  
end
