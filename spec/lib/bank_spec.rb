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

    specify do
      bank.add_rate('CHF', 'USD', 2)
      result = bank.reduce(MoneyFactory.franc(2), 'USD')
      expect(result).to eq MoneyFactory.dollar(1)
    end

    specify do
      bank.add_rate('CHF', 'USD', 5)
      result = bank.reduce(MoneyFactory.franc(5), 'USD')
      expect(result).to eq MoneyFactory.dollar(1)
    end

    specify do
      five_bucks = MoneyFactory.dollar(5)
      ten_francs = MoneyFactory.franc(10)
      sum = Sum.new(five_bucks, ten_francs)
      bank.add_rate('CHF', 'USD', 2)
      reduced = bank.reduce(sum, 'USD')
      expect(reduced).to eq Money.new(10, 'USD')
    end
  end

  context '#rate' do
    specify do
      bank.add_rate('CHF', 'USD', 5)
      expect(bank.rate('CHF', 'USD')).to eq 5
      expect(bank.rate('USD', 'USD')).to eq 1
      expect(bank.rate('CHF', 'CHF')).to eq 1
    end
  end
end
