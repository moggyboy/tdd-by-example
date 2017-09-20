# frozen_string_literal: true

class Bank
  def initialize
    @rates = Hash.new { |hash, key| hash[key] = {} }
  end

  def add_rate(from_currency, to_currency, exchange_rate)
    @rates[from_currency][to_currency] = exchange_rate
  end

  def rate(from_currency, to_currency)
    return 1 if from_currency == to_currency
    @rates[from_currency][to_currency]
  end

  def reduce(expression, currency)
    expression.reduce(self, currency)
  end
end
