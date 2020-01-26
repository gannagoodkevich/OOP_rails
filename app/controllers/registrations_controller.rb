class RegistrationsController < ApplicationController
  skip_before_action :authenticate!

  def show
    @signup = Signup.new()
  end

  def create
    signup =  RegisterUser.new(Signup.new(signup_params)).execute
    if signup
      flash[:notice] = t("registrations.user.success")
      redirect_to user_path(signup.user.id)
    else
      redirect_to :root
    end
  end

  private

  def signup_params
    params.require(:signup).permit!
  end

  def card_params
    params.require(:user).permit(:card_number, :name, :account_BYN)
  end

  def address_params
    params.require(:user).permit(:country, :city, :street, :house_number, :apartment_number)
  end
end