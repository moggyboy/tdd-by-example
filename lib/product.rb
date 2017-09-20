# frozen_string_literal: true

class Product < Expression
  attr_reader :augend, :multiplier

  def initialize(augend, multiplier)
    @augend = augend
    @multiplier = multiplier
  end

  def reduce(bank, currency)
    amount = augend.reduce(bank, currency).amount * multiplier
    Money.new(amount, currency)
  end
end
