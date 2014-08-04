class UserMailer < ActionMailer::Base
  default from: "founders@friendcircles.com"

  def password_reset_email(user)
    @user = user
    @token = user.forgot_token
    mail(to: user.email, subject: "Reset Your Password")
  end
end
