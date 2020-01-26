class ChangeCurrency
  USD_TO_BYN = 2.113
  EUR_TO_BYN = 2.331
  RUB_TO_BYN = 0.003415

  def initialize(money)
    @money = money
  end

  def change_currency(currency)
    send("#{@money.currency.downcase}_to_#{currency.downcase}")
    @money
  end

  private

  def usd_to_byn
    amount = @money.amount.to_f
    amount *= USD_TO_BYN
    @money.amount = amount.to_s
    @money.currency = 'BYN'
  end

  def eur_to_byn
    amount = @money.amount.to_f
    amount *= EUR_TO_BYN
    @money.amount = amount.to_s
    @money.currency = 'BYN'
  end

  def rub_to_byn
    amount = @money.amount.to_f
    amount *= RUB_TO_BYN
    @money.amount = amount.to_s
    @money.currency = 'BYN'
  end

  def byn_to_byn
  end

  def usd_to_usd
  end

  def eur_to_usd
    amount = @money.amount.to_f
    amount *= EUR_TO_BYN / USD_TO_BYN
    @money.amount = amount.to_s
    @money.currency = 'USD'
  end

  def rub_to_usd
    amount = @money.amount.to_f
    amount *= RUB_TO_BYN / USD_TO_BYN
    @money.amount = amount.to_s
    @money.currency = 'USD'
  end

  def byn_to_usd
    amount = @money.amount.to_f
    amount /= USD_TO_BYN
    @money.amount = amount.to_s
    @money.currency = 'USD'
  end

  def usd_to_eur
    amount = @money.amount.to_f
    amount *= USD_TO_BYN / EUR_TO_BYN
    @money.amount = amount.to_s
    @money.currency = 'EUR'
  end

  def eur_to_eur
  end

  def rub_to_eur
    amount = @money.amount.to_f
    amount *= RUB_TO_BYN / EUR_TO_BYN
    @money.amount = amount.to_s
    @money.currency = 'EUR'
  end

  def byn_to_eur
    amount = @money.amount.to_f
    amount /= EUR_TO_BYN
    @money.amount = amount.to_s
    @money.currency = 'EUR'
  end

  def usd_to_rub
    amount = @money.amount.to_f
    amount *= USD_TO_BYN / RUB_TO_BYN
    @money.amount = amount.to_s
    @money.currency = 'RUB'
  end

  def eur_to_rub
    amount = @money.amount.to_f
    amount *= EUR_TO_BYN / RUB_TO_BYN
    @money.amount = amount.to_s
    @money.currency = 'RUB'
  end

  def rub_to_rub
  end

  def byn_to_rub
    amount = @money.amount.to_f
    amount /= RUB_TO_BYN
    @money.amount = amount.to_s
    @money.currency = 'RUB'
  end
end
