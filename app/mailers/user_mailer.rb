class UserMailer < ApplicationMailer
  default from: 'aroundofyou@gmail.com'

  def user_email(email,body)
    @body=body
    @email=email
    mail(to: @email, subject: 'Admin mail')
  end
end
