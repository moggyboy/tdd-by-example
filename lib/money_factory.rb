# frozen_string_literal: true

require 'dollar'
require 'franc'

class MoneyFactory
  def self.dollar(amount)
    Dollar.new(amount)
  end

  def self.franc(amount)
    Franc.new(amount)
  end
end
