# Preview all emails at http://localhost:3000/rails/mailers/login_mailer
class LoginMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/login_mailer/login_msg
  def login_msg
    LoginMailer.login_msg

   	login = Login.first
	LoginMailer.login_msg(login)


  end

end
