# frozen_string_literal: true

require 'spec_helper'
require 'money'
require 'money_factory'
require 'sum'
require 'bank'

describe Money do
  let(:money) { described_class.new(5, 'USD') }
  let(:bank) { Bank.new }

  describe '#times' do
    specify { expect(bank.reduce(money.times(2), 'USD')).to eq described_class.new(10, 'USD') }
    specify { expect(bank.reduce(money.times(3), 'USD')).to eq described_class.new(15, 'USD') }
  end

  describe '#<=>' do
    specify { expect(money == described_class.new(5, 'USD')).to be true }
    specify { expect(money == described_class.new(4, 'USD')).to be false }
    specify { expect(money >= described_class.new(4, 'USD')).to be true }
    specify { expect(money > described_class.new(4, 'USD')).to be true }
    specify { expect(money >= described_class.new(6, 'USD')).to be false }
    specify { expect(money > described_class.new(6, 'USD')).to be false }

    specify { expect(MoneyFactory.dollar(5) == MoneyFactory.dollar(6)).to be false }
    specify { expect(MoneyFactory.franc(5) == MoneyFactory.franc(6)).to be false }
    specify { expect(MoneyFactory.franc(5) == MoneyFactory.dollar(5)).to be false }
  end

  describe '#currency' do
    specify { expect(MoneyFactory.dollar(1).currency).to eq 'USD' }
    specify { expect(MoneyFactory.franc(1).currency).to eq 'CHF' }
  end

  describe '#plus' do
    specify do
      five = MoneyFactory.dollar(5)
      sum = five.plus(five)
      expect(sum.augend).to eq five
      expect(sum.addend).to eq five
    end
  end
end
