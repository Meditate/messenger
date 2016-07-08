class UserMailer < ApplicationMailer
  default from: 'aroundofyou@gmail.com'

  def user_email(user,email,body)
    @user=user
    @body=body
    @email=email
    mail(to: @email, subject: 'Admin mail')
  end
end
