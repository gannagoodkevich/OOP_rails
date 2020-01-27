class UserMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def admin_email
    @user = params[:user]
    @admin = params[:admin]
    mail(to: @admin.email, subject: 'New user was signed up')
  end
end
