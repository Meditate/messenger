class UserMailer < ApplicationMailer
  default from: 'aroundofyou@gmail.com'
  layout 'mailer'

  def user_email(email,email_params)
    @email=email
    @file=email_params[:file]
    attachments[@file.original_filename]=File.read("#{@file.path}")
    @content=email_params[:content]
    mail(to: @email, subject: 'Admin mail')
  end

end
