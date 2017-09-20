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
      sum = five.plus(five)
      reduced = bank.reduce(sum, 'USD')
      expect(reduced).to eq Money.new(10, 'USD')
    end
  end
end
