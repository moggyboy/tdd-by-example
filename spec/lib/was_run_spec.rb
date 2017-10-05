# frozen_string_literal: true

require 'was_run'

describe WasRun do
  describe '#was_run' do
    specify do
      was_run = described_class.new('test_method')
      expect(was_run.was_run).to be false
      was_run.test_method
      expect(was_run.was_run).to be true
    end
  end
end
