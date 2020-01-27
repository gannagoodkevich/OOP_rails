class RegisterUser
  def initialize(signup)
    @signup = signup
    @admin = User.first
  end

  def execute
    return nil unless @signup.save

    puts @signup.user.inspect
    UserMailer.with(user: @signup.user).welcome_email.deliver_now
    UserMailer.with(user: @signup.user, admin: @admin).admin_email.deliver_now
    @signup
  end
end