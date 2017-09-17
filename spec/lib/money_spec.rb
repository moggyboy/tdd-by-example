# frozen_string_literal: true

require 'spec_helper'
require 'money'
require 'money_factory'

describe Money do
  let(:money) { described_class.new(5) }

  describe '#times' do
    specify { expect(money.times(2)).to eq described_class.new(10) }
    specify { expect(money.times(3)).to eq described_class.new(15) }
  end

  describe '#<=>' do
    specify { expect(money == described_class.new(5)).to be true }
    specify { expect(money == described_class.new(4)).to be false }
    specify { expect(money >= described_class.new(4)).to be true }
    specify { expect(money > described_class.new(4)).to be true }
    specify { expect(money >= described_class.new(6)).to be false }
    specify { expect(money > described_class.new(6)).to be false }

    specify { expect(MoneyFactory.dollar(5) == MoneyFactory.dollar(5)).to be true }
    specify { expect(MoneyFactory.dollar(5) == MoneyFactory.dollar(6)).to be false }
    specify { expect(MoneyFactory.franc(5) == MoneyFactory.franc(5)).to be true }
    specify { expect(MoneyFactory.franc(5) == MoneyFactory.franc(6)).to be false }
    specify { expect(MoneyFactory.franc(5) == MoneyFactory.dollar(5)).to be false }
  end

  describe '#currency' do
    specify { expect { money.currency }.to raise_error NotImplementedError }
    specify { expect(MoneyFactory.dollar(1).currency).to eq 'USD' }
    specify { expect(MoneyFactory.franc(1).currency).to eq 'CHF' }
  end
end
