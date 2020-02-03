class RegistrationsController < ApplicationController
  skip_before_action :authenticate!

  def show
    @user_form = UserRegistrationForm.new
  end

  def create
    registrations_result = RegisterUserService.new(signup_result).call
    if registrations_result.success?
      flash[:notice] = t('registrations.user.success')
      redirect_to user_path(registrations_result.user.id)
    else
      redirect_to :root
    end
  end

  private

  def signup_result
    UserRegistrationForm.new(registration_params)
  end

  def registration_params
    params.require(:user_registration_form).permit!
  end
end
