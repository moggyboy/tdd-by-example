# frozen_string_literal: true

require 'spec_helper'
require 'bank'
require 'expression'
require 'money'
require 'money_factory'

describe Bank do
  let(:bank) { described_class.new }

  describe '#reduce' do
    specify do
      five = MoneyFactory.dollar(5)
      reduced = bank.reduce(five, 'USD')
      expect(reduced).to eq Money.new(5, 'USD')
    end

    specify do
      five = MoneyFactory.dollar(5)
      sum = Sum.new(five, five)
      reduced = bank.reduce(sum, 'USD')
      expect(reduced).to eq Money.new(10, 'USD')
    end

    specify do
      three = MoneyFactory.dollar(3)
      sum = Sum.new(three, three)
      reduced = bank.reduce(sum, 'USD')
      expect(reduced).to eq Money.new(6, 'USD')
    end
  end
end
