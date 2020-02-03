class UsersController < ApplicationController
  skip_before_action :authenticate!

  def show
    user = User.find_by(id: params[:id])
    not_existed_error if user.nil?

    money = MoneyValue.new(amount: user.card.account_BYN, currency: 'BYN')
    @change_currency = ChangeCurrencyService.new(money)
  end
end
