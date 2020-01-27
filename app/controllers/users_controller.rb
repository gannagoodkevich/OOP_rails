class UsersController < ApplicationController
  skip_before_action :authenticate!

  def show
    user = User.find_by(id: params[:id])
    money = Money.new(amount: user.card.account_BYN, currency: 'BYN')
    @change_currency = ChangeCurrency.new(money)
  end
end