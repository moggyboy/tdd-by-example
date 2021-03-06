# frozen_string_literal: true

require 'was_run'
require 'test_case'
require 'test_suite'

class TestCaseTest < TestCase
  def set_up
    @result = TestResult.new
  end

  def test_template_methods
    @test = WasRun.new('test_method')
    @test.run(@result)
    assert_equal(@test.log, %w[set_up test_method tear_down])
  end

  def test_result
    @test = WasRun.new('test_method')
    @test.run(@result)
    assert_equal('1 run, 0 failed', @result.summary)
  end

  def test_failed_result
    @test = WasRun.new('test_broken_method')
    @test.run(@result)
    assert_equal('1 run, 1 failed', @result.summary)
  end

  def test_suite
    suite = TestSuite.new
    suite.add(WasRun.new('test_method'))
    suite.add(WasRun.new('test_broken_method'))

    suite.run(@result)
    assert_equal('2 run, 1 failed', @result.summary)
  end

  def tear_down
  end
end
