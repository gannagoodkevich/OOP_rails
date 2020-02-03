class RegisterUserService
  def initialize(user_form)
    @user_form = user_form
    @admin = User.first
  end

  def call
    return nil unless @user_form.save

    generate_confirmation_token

    UserMailer.with(user: @user_form.user).welcome_email.deliver_now
    UserMailer.with(user: @user_form.user, admin: @admin).admin_email.deliver_now
    @user_form
  end

  private

  def generate_confirmation_token
    loop do
      token = SecureRandom.urlsafe_base64
      next if User.where(confirmation_token: token).any?

      @user_form.user.update!(confirmation_token: token, confirmation_sent_at: Time.now.utc)
      break
    end
  end
end
