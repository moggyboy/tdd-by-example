# frozen_string_literal: true

class Expression
  def reduce(_bank, _currency)
    raise NotImplementedError
  end

  def plus(addend)
    Sum.new(self, addend)
  end

  def times(multiplier)
    Product.new(self, multiplier)
  end
end
