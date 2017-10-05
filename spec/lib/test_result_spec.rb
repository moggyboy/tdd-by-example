# frozen_string_literal: true

require 'test_result'

describe TestResult do
  let(:test_result) { described_class.new }

  describe '#summary' do
    subject(:summary) { test_result.summary }

    context 'one test passed' do
      before { test_result.test_passed }

      it { is_expected.to eq '1 run, 0 failed' }
    end

    context 'one test failed' do
      before { test_result.test_failed }

      it { is_expected.to eq '1 run, 1 failed' }
    end
  end
end
