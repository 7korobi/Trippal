class WelcomeMailer < ActionMailer::Base
  default from:    "welcome@trippal.in"
  default subject: "Welcome to TRIPPAL"
  def coming_soon(welcome)
    mail(to: welcome.mailto)
  end
end
