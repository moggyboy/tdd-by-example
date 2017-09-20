# frozen_string_literal: true

require 'spec_helper'
require 'bank'
require 'expression'
require 'money'
require 'money_factory'

describe Sum do
  let(:bank) { Bank.new }

  describe '#plus' do
    specify do
      five_bucks = MoneyFactory.dollar(5)
      ten_francs = MoneyFactory.franc(10)
      bank.add_rate('CHF', 'USD', 2)
      sum = described_class.new(five_bucks, ten_francs).plus(five_bucks)
      reduced = bank.reduce(sum, 'USD')
      expect(reduced).to eq MoneyFactory.dollar(15)
    end
  end

  describe '#times' do
    specify do
      five_bucks = MoneyFactory.dollar(5)
      ten_francs = MoneyFactory.franc(10)
      bank.add_rate('CHF', 'USD', 2)
      sum = described_class.new(five_bucks, ten_francs).times(2)
      reduced = bank.reduce(sum, 'USD')
      expect(reduced).to eq MoneyFactory.dollar(20)
    end
  end
end
