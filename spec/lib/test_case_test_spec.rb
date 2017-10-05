# frozen_string_literal: true

require 'test_case_test'

describe TestCaseTest do
  let(:test_case_test) { described_class.new(method_name) }

  describe '#test_template_methods' do
    let(:method_name) { 'test_template_methods' }

    specify do
      test_case_test.run
    end
  end

  describe '#test_result' do
    let(:method_name) { 'test_result' }

    specify do
      test_case_test.run
    end
  end

  describe '#test_failed_result' do
    let(:method_name) { 'test_failed_result' }

    specify do
      test_case_test.run
    end
  end
end
