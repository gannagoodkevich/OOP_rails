class Money
  attr_accessor :amount, :currency

  def initialize(amount:, currency:)
    @amount = amount
    @currency = currency
  end

  def hash
    @amount.hash + @currency.hash
  end

  def ==(other)
    self.class == other.class && @amount == other.amount && @currency == other.currency
  end

  def eql?(other)
    to_s == other.to_s
  end

  def to_s
    @amount.to_s + ' ' + @currency.to_s
  end
end
