class UserMailer < ApplicationMailer
  default from: 'aroundofyou@gmail.com'
  layout 'mailer'

  def user_email(email_params)
    @content=email_params[:content]
    @email=ENV['inbox']
    mail(to: @email, subject: 'Admin mail')
  end
end
