# frozen_string_literal: true

require 'spec_helper'
require 'money'
require 'money_factory'

describe Money do
  let(:money) { described_class.new(5) }

  describe '#times' do
    specify do
      expect(money.times(2)).to eq described_class.new(10)
      expect(money.times(3)).to eq described_class.new(15)
    end
  end

  describe '#<=>' do
    specify do
      expect(money == described_class.new(5)).to be true
      expect(money == described_class.new(4)).to be false
      expect(money >= described_class.new(4)).to be true
      expect(money > described_class.new(4)).to be true
      expect(money >= described_class.new(6)).to be false
      expect(money > described_class.new(6)).to be false

      expect(MoneyFactory.dollar(5) == MoneyFactory.dollar(5)).to be true
      expect(MoneyFactory.dollar(5) == MoneyFactory.dollar(6)).to be false
      expect(MoneyFactory.franc(5) == MoneyFactory.franc(5)).to be true
      expect(MoneyFactory.franc(5) == MoneyFactory.franc(6)).to be false
      expect(MoneyFactory.franc(5) == MoneyFactory.dollar(5)).to be false
    end
  end
end
