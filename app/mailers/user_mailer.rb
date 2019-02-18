class UserMailer < ApplicationMailer
  default from: 'clecotech@example.com'
 
  def welcome_email(user, password)
    @user = user
    @password = password
    mail(to: @user, subject: 'Welcome to My Awesome Site')
  end
end
