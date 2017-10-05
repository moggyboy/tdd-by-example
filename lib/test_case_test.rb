# frozen_string_literal: true

require 'was_run'
require 'test_case'

class TestCaseTest < TestCase
  def set_up
  end

  def test_template_methods
    @test = WasRun.new('test_method')
    @test.run
    assert_equal(@test.log, %w[set_up test_method tear_down])
  end

  def test_result
    @test = WasRun.new('test_method')
    result = @test.run
    assert_equal('1 run, 0 failed', result.summary)
  end

  def test_failed_result
    @test = WasRun.new('test_broken_method')
    result = @test.run
    assert_equal('1 run, 1 failed', result.summary)
  end

  def tear_down
  end
end
