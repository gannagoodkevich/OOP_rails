class RegistrationsController < ApplicationController
  skip_before_action :authenticate!

  def show
    @user = User.new
  end

  def create
    user = User.create!(user_params)
    user.create_card!(card_params)
    user.create_address!
    flash[:notice] = t("registrations.user.success")
    redirect_to :root
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def card_params
    params.require(:user).permit(:card_number, :name, :account_BYN)
  end

  def address_params
    params.require(:user).permit(:country, :city, :street, :house_number, :apartment_number)
  end
end