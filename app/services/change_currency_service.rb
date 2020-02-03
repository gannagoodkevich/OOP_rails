class ChangeCurrencyService
  USD_TO_BYN = 2.113
  EUR_TO_BYN = 2.331
  RUB_TO_BYN = 0.003415

  def initialize(money)
    @money = money
    @amount = @money.amount.to_f
  end

  def change_currency(currency)
    send("#{@money.currency.downcase}_to_#{currency.downcase}")
    @money.amount = @amount.round(2).to_s
    @money.currency = currency
    @money
  end

  private

  def usd_to_byn
    @amount *= USD_TO_BYN
  end

  def eur_to_byn
    @amount *= EUR_TO_BYN
  end

  def rub_to_byn
    @amount *= RUB_TO_BYN
  end

  def eur_to_usd
    @amount *= EUR_TO_BYN / USD_TO_BYN
  end

  def rub_to_usd
    @amount *= RUB_TO_BYN / USD_TO_BYN
  end

  def byn_to_usd
    @amount /= USD_TO_BYN
  end

  def usd_to_eur
    @amount *= USD_TO_BYN / EUR_TO_BYN
  end

  def rub_to_eur
    @amount *= RUB_TO_BYN / EUR_TO_BYN
  end

  def byn_to_eur
    @amount /= EUR_TO_BYN
  end

  def usd_to_rub
    @amount *= USD_TO_BYN / RUB_TO_BYN
  end

  def eur_to_rub
    @amount *= EUR_TO_BYN / RUB_TO_BYN
  end

  def byn_to_rub
    @amount /= RUB_TO_BYN
  end

  def method_missing(method_name, *args, &block)
    super unless %w[rub_to_rub eur_to_eur usd_to_usd byn_to_byn].include?(method_name)
  end

  def respond_to_missing?(method_name, *args)
    %w[rub_to_rub eur_to_eur usd_to_usd byn_to_byn].include?(method_name) || super
  end
end
