class LoginMailer < ActionMailer::Base
 default from: "pgokulmca2014@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.login_mailer.login_msg.subject
  #
  def login_msg(login)
       @login = login
       @greeting = "Hi"

    mail to: @login.email, subject: "Confirmation instructions!"
  end
end
