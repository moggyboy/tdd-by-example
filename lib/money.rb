# frozen_string_literal: true

class Money
  include Comparable

  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end

  def times(multiplier)
    self.class.new(@amount * multiplier)
  end

  def <=>(other)
    raise ArgumentError unless other.is_a?(Money)
    return nil unless other.is_a?(self.class)

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
