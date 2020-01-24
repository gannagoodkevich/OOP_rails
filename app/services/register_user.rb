class RegisterUser
  def initialize(signup)
    @signup = signup
    @admin_mail = User.first
  end

  def execute
    return nil unless @signup.save
    UserMailer.with(user: @signup.user).welcome_email.deliver_now
    UserMailer.with(user: @admin_mail).welcome_email.deliver_now
    @signup
  end
end