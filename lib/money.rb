# frozen_string_literal: true

class Money
  include Comparable

  attr_reader :amount, :currency

  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def times(multiplier)
    Money.new(@amount * multiplier, currency)
  end

  def <=>(other)
    raise ArgumentError unless other.is_a?(Money)
    return nil unless other.currency == currency

    other_amount = other.amount
    if @amount < other_amount
      -1
    elsif @amount > other_amount
      1
    else
      0
    end
  end

  def plus(money)
    raise ArgumentError if money.currency != currency
    Money.new(amount + money.amount, currency)
  end
end
