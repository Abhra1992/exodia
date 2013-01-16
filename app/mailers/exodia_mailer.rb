class ExodiaMailer < ActionMailer::Base
  default from: "manager@exodia.in"
  
  def register_email(user)
    @user = user
    @url = "http://exodia.in/users/login"
    mail(:to => user.email, :subject => "Welcome to Exodia")
  end
  
  def participate_email(user, event)
    @user = user
    @event = event
    mail(:to => user.email, :subject => "Event Registration - Exodia")
  end
end
