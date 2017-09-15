# frozen_string_literal: true

class Dollar
  include Comparable

  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end

  def times(multiplier)
    Dollar.new(@amount * multiplier)
  end

  def <=>(other)
    other_amount = other.amount
    if @amount < other_amount
      -1
    elsif @amount > other_amount
      1
    else
      0
    end
  end
end
