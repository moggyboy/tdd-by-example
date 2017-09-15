# frozen_string_literal: true

require 'spec_helper'
require 'dollar'

describe Dollar do
  describe '#times' do
    subject { dollar.times(2).amount }

    let(:dollar) { described_class.new(5) }

    it { is_expected.to eq 10 }
  end
end
