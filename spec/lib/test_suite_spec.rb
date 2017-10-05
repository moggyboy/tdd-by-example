# frozen_string_literal: true

require 'test_suite'
require 'test_case_test'

describe TestSuite do
  let(:test_suite) { described_class.new }

  specify do
    test_result = TestResult.new
    test_suite.add(TestCaseTest.new('test_template_methods'))
    test_suite.add(TestCaseTest.new('test_result'))
    test_suite.add(TestCaseTest.new('test_failed_result'))
    test_suite.add(TestCaseTest.new('test_suite'))
    test_suite.run(test_result)
    expect(test_result.summary).to include '0 failed'
  end
end
