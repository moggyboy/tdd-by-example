# frozen_string_literal: true

require 'spec_helper'
require 'dollar'

describe Dollar do
  let(:dollar) { described_class.new(5) }

  describe '#times' do
    specify do
      expect(dollar.times(2).amount).to eq 10
      expect(dollar.times(3).amount).to eq 15
    end
  end

  describe '#<=>' do
    specify do
      expect(dollar == described_class.new(5)).to be true
      expect(dollar == described_class.new(4)).to be false
      expect(dollar >= described_class.new(4)).to be true
      expect(dollar > described_class.new(4)).to be true
      expect(dollar >= described_class.new(6)).to be false
      expect(dollar > described_class.new(6)).to be false
    end
  end
end
