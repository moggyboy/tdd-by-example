# frozen_string_literal: true

require 'spec_helper'
require 'dollar'

describe Dollar do
  describe '#times' do
    subject(:times) { dollar.times(2) }

    let(:dollar) { described_class.new(5) }

    specify do
      times
      expect(dollar.amount).to eq 10
    end
  end
end
