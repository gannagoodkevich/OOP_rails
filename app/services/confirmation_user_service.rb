class ConfirmationUserService
  def initialize(confirmation_token)
    @user = User.find_by(confirmation_token: confirmation_token)
  end

  def call
    return nil if @user.nil?

    @user.confirm!
    @user
  end
end
