# frozen_string_literal: true

require 'spec_helper'
require 'money'
require 'dollar'
require 'franc'

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

      expect(Dollar.new(5) == Dollar.new(5)).to be true
      expect(Dollar.new(5) == Dollar.new(6)).to be false
      expect(Franc.new(5) == Franc.new(5)).to be true
      expect(Franc.new(5) == Franc.new(6)).to be false
      expect(Franc.new(5) == Dollar.new(5)).to be false
    end
  end
end
